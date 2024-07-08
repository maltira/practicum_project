// import 'package:postgres/postgres.dart';
//
// import '../pages/title.dart';
//
// var conn;
// var countCredits, countClients, countTypes;
// Map list = {'credit_data': countCredits, 'user_data': countClients, 'type': countTypes};
//
// Future requestPostgres() async {
//   try {
//     final settings = ConnectionSettings(
//       sslMode: SslMode.disable,
//       connectTimeout: Duration(seconds: 10),
//     );
//     conn = await Connection.open(Endpoint(
//       host: 'localhost',
//       database: 'postgres',
//       username: 'postgres',
//       password: '12341234',
//     ), settings: settings);
//     countCredits = await conn.execute(Sql.named('SELECT COUNT(*) FROM public.credit_data')); countCredits = countCredits[0][0];
//     countClients = await conn.execute(Sql.named('SELECT COUNT(*) FROM public.user_data')); countClients = countClients[0][0];
//     countTypes = await conn.execute(Sql.named('SELECT COUNT(*) FROM public.type')); countTypes = countTypes[0][0];
//
//     list['credit_data'] = countCredits;
//     list['user_data'] = countClients;
//     list['type'] = countTypes;
//
//     ConnectionStatus=true;
//   } catch (e) {
//     print("error: ${e.toString()}");
//     ConnectionStatus=false;
//     WarningMessage = e.toString();
//   }
// }
//
//
// Future PostgresSELECT({required String table}) async {
//   List allElements = await conn.execute(Sql.named('SELECT * FROM public.$table'));
//   return allElements;
// }
//
// Future PostgresDELETE({required String table, required int index}) async {
//   int i = index;
//   await conn.execute('DELETE FROM public.$table WHERE id=$index');
//
//   if (table == 'credit_data')
//     while (i < list[table]) {
//       await conn.execute('UPDATE public.$table SET id=$i WHERE id=${i+1}');
//       i++;
//     }
// }
//
// Future PostgresCreditUPDATE({ required int index, required int new_sum, required String new_date}) async{
//   print(new_date);
//   print(index);
//   await conn.execute('UPDATE public.credit_data SET summ=$new_sum, date=\'$new_date\' WHERE id=$index');
// }
// Future PostgresTypeUPDATE({required int index, required String name, required String usl, required int rate, required int period}) async{
//   await conn.execute('UPDATE public.type SET name=\'$name\', conditions=\'$usl\', rate=$rate, period=$period WHERE id=$index');
// }
// Future PostgresClientUPDATE({required int index, required String name, required String own, required String address, required String phone, required String person}) async{
//   await conn.execute('UPDATE public.user_data SET company_name=\'$name\', type_of_ownership=\'$own\', address=\'$address\', phone_number=\'$phone\', contact_person=\'$person\' WHERE id=$index');
// }
// Future PostgresCheck({required String table, required int type_index}) async{
//   List arg = await PostgresSELECT(table: 'credit_data');
//   int ind = (table == 'type') ? 3 : 2;
//   bool flag = false;
//   for (int i = 0; i<countCredits; i++) {
//     print('${arg[i][ind]} $type_index');
//     if (arg[i][ind] == type_index)
//       flag = true;
//   }
//   return flag;
// }
//
// Future MaxID({required String table}) async{
//   List arg = await PostgresSELECT(table: table);
//   int maxID = 0;
//   for (int i = 0; i<list[table]; i++) {
//     if (table == 'type') maxID = (maxID < arg[i][4]) ? arg[i][4] : maxID;
//     else if (table == 'user_data') maxID = (maxID < arg[i][5]) ? arg[i][5] : maxID;
//     else if (table == 'credit_data') maxID = (maxID < arg[i][4]) ? arg[i][4] : maxID;
//   }
//   return maxID;
// }