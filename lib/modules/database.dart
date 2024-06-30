
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:postgres/postgres.dart';

import '../pages/title.dart';


var conn;
var countCredits, countClients, countTypes;
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

    //Get.offNamed('/');
    ConnectionStatus=true;
  } catch (e) {
    print("error: ${e.toString()}");
    ConnectionStatus=false;
    WarningMessage = e.toString();
  }
}

// index:    0 - sum, 1 - date, 2 - user_id, 3 - type_id, 4 - operation id
Future PostgresSELECT({required String table, required int index}) async {
  Map<String, int> list = {'sum': 0, 'date': 1, 'user_id': 2, 'type_id': 3, 'operation_id': 4};

  final result = await conn.execute(Sql.named('SELECT * FROM public.$table WHERE id=$index'));
  List all = [result[0][0].toString(), result[0][1], result[0][2].toString(), result[0][3].toString()];
  print(all);
}
