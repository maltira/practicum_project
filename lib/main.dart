import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practicum_project/pages/client_data.dart';
import 'package:practicum_project/pages/credit_table.dart';
import 'package:practicum_project/pages/credit_type.dart';
import 'package:practicum_project/pages/title.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(GetMaterialApp(
      debugShowCheckedModeBanner: false,

      initialRoute: '/',
      getPages: [
        GetPage(
            name: '/',
            page: () => CreditTablePage(),
            transition: Transition.fadeIn,
            transitionDuration: Duration(milliseconds: 50)
        ),
        GetPage(
            name: '/client',
            page: () => ClientPage(),
            transition: Transition.fadeIn,
            transitionDuration: Duration(milliseconds: 50)
        ),
        GetPage(
            name: '/creditType',
            page: () => CreditTypePage(),
            transition: Transition.fadeIn,
            transitionDuration: Duration(milliseconds: 50)
        ),
        // GetPage(
        //    name: '/creditTable',
        //    page: () => CreditTablePage(),
        //    transition: Transition.fade,
        //    transitionDuration: Duration(milliseconds: 50)),
      ]
  ));
}

