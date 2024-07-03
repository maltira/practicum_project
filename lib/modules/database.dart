import 'package:postgres/postgres.dart';

import '../pages/title.dart';

var conn;
var countCredits, countClients, countTypes;
Map list = {'credit_data': countCredits, 'user_data': countClients, 'type': countTypes};

Future requestPostgres() async {
  try {
    final settings = ConnectionSettings(
      sslMode: SslMode.disable,
      connectTimeout: Duration(seconds: 10),
    );
    conn = await Connection.open(Endpoint(
      host: 'localhost',
      database: 'postgres',
      username: 'postgres',
      password: '12341234',
    ), settings: settings);
    countCredits = await conn.execute(Sql.named('SELECT COUNT(*) FROM public.credit_data')); countCredits = countCredits[0][0];
    countClients = await conn.execute(Sql.named('SELECT COUNT(*) FROM public.user_data')); countClients = countClients[0][0];
    countTypes = await conn.execute(Sql.named('SELECT COUNT(*) FROM public.type')); countTypes = countTypes[0][0];

    list['credit_data'] = countCredits;
    list['user_data'] = countClients;
    list['type'] = countTypes;

    ConnectionStatus=true;
  } catch (e) {
    print("error: ${e.toString()}");
    ConnectionStatus=false;
    WarningMessage = e.toString();
  }
}


Future PostgresSELECT({required String table}) async {
  List allElements = [];
  for (int i = 1; i<=list[table]; i++) {
    final result = await conn.execute(Sql.named('SELECT * FROM public.$table WHERE id=$i'));
    allElements.add(result[0]);
  }
  return allElements;
}

Future PostgresDELETE({required String table, required int index}) async {
  int i = index;
  await conn.execute('DELETE FROM public.$table WHERE id=$index');

  while (i < list[table]) {
    if (table == 'credit_data')
      await conn.execute('UPDATE public.$table SET id=$i WHERE id=${i+1}');
    else if (table == 'type')
      await conn.execute('UPDATE public.$table SET id=$i WHERE id=${i+1}');
    i++;
  }
}

Future PostgresCreditUPDATE({ required int index, required int new_sum, required String new_date}) async{
  await conn.execute('UPDATE public.credit_data SET summ=$new_sum, date=\'$new_date\' WHERE id=$index');
}
Future PostgresTypeUPDATE({required int index, required String name, required String usl, required int rate, required int period}) async{
  await conn.execute('UPDATE public.type SET name=\'$name\', conditions=\'$usl\', rate=$rate, period=$period WHERE id=$index');
}
Future PostgresCheck({required int type_index}) async{
  List arg = await PostgresSELECT(table: 'credit_data');
  bool flag = false;
  for (int i = 0; i<countCredits; i++) {

    if (arg[i][3] == type_index)
      flag = true;
  }
  return flag;
}
