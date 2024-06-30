import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';


Widget CustomDrawer(int index, BuildContext context) {
  return Drawer(
    width: 490,
    child: Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/background/drawer_bg.png'),
              fit: BoxFit.cover,
              alignment: Alignment.topRight
          )
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(flex: 5,),
          ListTile(
            title: Text(
              'Таблица кредитов',
              style: GoogleFonts.montserrat(
                textStyle: TextStyle(
                  fontSize: 28,
                  color: index == 0 ? Colors.white : Colors.white.withOpacity(0.5),
                  fontWeight: FontWeight.w600,
                ),
              ),
              textAlign: TextAlign.center,
            ),
            selected: index == 0,
            onTap: () {
              Navigator.pop(context);
              Get.offNamed('/');
            },
          ),
          Spacer(flex: 1,),
          ListTile(
            title: Text(
              'Виды кредитов',
              style: GoogleFonts.montserrat(
                textStyle: TextStyle(
                  fontSize: 28,
                  color: index == 1 ? Colors.white : Colors.white.withOpacity(0.5),
                  fontWeight: FontWeight.w600,
                ),
              ),
              textAlign: TextAlign.center,
            ),
            selected: index == 1,
            onTap: () {
              Navigator.pop(context);
              Get.offNamed('/creditType');
            },
          ),
          Spacer(flex: 1,),
          ListTile(
            title: Text(
              'Клиенты',
              style: GoogleFonts.montserrat(
                textStyle: TextStyle(
                  fontSize: 28,
                  color: index == 2 ? Colors.white : Colors.white.withOpacity(0.5),
                  fontWeight: FontWeight.w600,
                ),
              ),
              textAlign: TextAlign.center,
            ),
            selected: index == 2,
            onTap: () {
              Navigator.pop(context);
              Get.offNamed('/client');
            },
          ),
          Spacer(flex: 5,),
        ],
      ),
    ),
  );
}
