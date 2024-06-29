import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practicum_project/pages/credit_table.dart';
import 'package:practicum_project/pages/title.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(GetMaterialApp(
      debugShowCheckedModeBanner: false,

      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => TitlePage()),
        GetPage(
           name: '/creditTable',
           page: () => CreditTablePage(),
           transition: Transition.fade,
           transitionDuration: Duration(milliseconds: 50)),
      ]
  ));
}

