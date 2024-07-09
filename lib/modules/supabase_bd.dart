import 'package:supabase_flutter/supabase_flutter.dart';

import '../pages/title.dart';

late final supabase;
var countCredits, countClients, countTypes;
bool connect = false;
Map list = {'credit_data': countCredits, 'client_data': countClients, 'credit_type': countTypes};

Future requestSupabase() async{
  try {
    if (connect == false) {
      await Supabase.initialize(
        url: 'https://hdcspnfagbkuohkerpxz.supabase.co',
        anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImhkY3NwbmZhZ2JrdW9oa2VycHh6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjAyODg2NTcsImV4cCI6MjAzNTg2NDY1N30.I9NlGbsI8JGOQhYdqYw0rCmWva-Qvpr4FrlX8nWqkA0',
      );
      supabase = Supabase.instance.client;
      connect = true;
    }
    countCredits = await _supabaseCount('credit_data');
    countClients = await _supabaseCount('client_data');
    countTypes = await _supabaseCount('credit_type');

    list['credit_data'] = countCredits;
    list['client_data'] = countClients;
    list['credit_type'] = countTypes;

    ConnectionStatus=true;
  }
  catch (e) {
    print('error: $e');
    ConnectionStatus=false;
    WarningMessage = e.toString();
  }
}

Future _supabaseCount(String table) async {
  List data = await supabase
      .from(table)
      .select('*');
  return data.length;
}

Future supabaseSELECT({required String table}) async {
  List data = await supabase.from(table).select('*');
  return data;
}

Future supabaseDELETE({required String table, required int index}) async {
  int i = index;
  await supabase.from(table).delete().eq('id', index);

  if (table == 'credit_data')
    while (i < list[table]) {
      await supabase.from('credit_data').update({'id': i}).eq('id', i+1);
      i++;
    }
}

Future supabaseCreditUPDATE({required int index, required int new_sum, required String new_date}) async {
  await supabase.from('credit_data').update({'sum': new_sum, 'date': new_date}).eq('id', index);
}
Future supabaseClientUPDATE({required int index, required String name, required String own, required String address, required String phone, required String person}) async {
  await supabase.from('client_data').update({'company_name': name, 'type_of_ownership': own, 'address': address, 'phone_number': phone, 'contact_person': person}).eq('id', index);
}
Future supabaseTypeUPDATE({required int index, required String name, required String usl, required int rate, required int period}) async {
  await supabase.from('credit_type').update({'name': name, 'conditions': usl, 'rate': rate, 'period': period}).eq('id', index);
}

Future supabaseCHECK({required String table, required int type_index}) async {
  List arg = await supabaseSELECT(table: 'credit_data');
  String ind = (table == 'credit_type') ? 'type_id' : 'user_id';
  bool flag = false;

  for (int i = 0; i<countCredits; i++) {
    if (arg[i][ind] == type_index)
      flag = true;
  }
  return flag;
}

Future FreeID({required String table}) async{

  List arg = await supabaseSELECT(table: table);

  int freeID = 0;
  // Максимальный элемент в таблице
  for (int i = 0; i<list[table]; i++)
    freeID = (freeID < arg[i]['id']) ? arg[i]['id'] : freeID;

  // Ищем свободные элемент до максимального
  for (int i = 1; i<=freeID+1; i++) {
    List argument = await supabase.from(table).select('id').eq('id', i);
    if (argument.isEmpty) {
      freeID = i;
      break;
    }
  }
  return freeID;
}