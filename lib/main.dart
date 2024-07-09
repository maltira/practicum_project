import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practicum_project/modules/search_page.dart';
import 'package:practicum_project/modules/supabase_bd.dart';
import 'package:practicum_project/modules/waiting.dart';
import 'package:practicum_project/pages/add/add_credit.dart';
import 'package:practicum_project/pages/add/add_type.dart';
import 'package:practicum_project/pages/client_data.dart';
import 'package:practicum_project/pages/credit_table.dart';
import 'package:practicum_project/pages/credit_type.dart';
import 'package:practicum_project/pages/edit/edit_client_page.dart';
import 'package:practicum_project/pages/edit/edit_credit_page.dart';
import 'package:practicum_project/pages/edit/edit_type_page.dart';
import 'package:practicum_project/pages/title.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  runApp(GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scrollbarTheme: ScrollbarThemeData(
            thumbVisibility: MaterialStateProperty.all(true),
            thickness: MaterialStateProperty.all(4),
            thumbColor: MaterialStateProperty.all(Colors.white),
          )
      ),

      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => TitlePage()),
        GetPage(
            name: '/credit',
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
        GetPage(
            name: '/wait',
            page: () => WaitingBetweenPages(),
            transition: Transition.fadeIn,
            transitionDuration: Duration(milliseconds: 50)
        ),
        GetPage(
            name: '/editcredit',
            page: () => EditELement(),
            transition: Transition.fadeIn,
            transitionDuration: Duration(milliseconds: 50)
        ),
        GetPage(
            name: '/edittype',
            page: () => EditTypePage(),
            transition: Transition.fadeIn,
            transitionDuration: Duration(milliseconds: 50)
        ),
        GetPage(
            name: '/editclient',
            page: () => EditClientPage(),
            transition: Transition.fadeIn,
            transitionDuration: Duration(milliseconds: 50)
        ),
        GetPage(
            name: '/newcredit',
            page: () => AddNewCredit(),
            transition: Transition.fadeIn,
            transitionDuration: Duration(milliseconds: 50)
        ),
        GetPage(
            name: '/newtype',
            page: () => AddNewType(),
            transition: Transition.fadeIn,
            transitionDuration: Duration(milliseconds: 50)
        ),
      ]
  ));
}

