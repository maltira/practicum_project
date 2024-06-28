import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practicum_project/pages/title.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(GetMaterialApp(
      debugShowCheckedModeBanner: false,

      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => TitlePage())
      ]
  ));
}

