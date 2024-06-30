import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../modules/custom_drawer.dart';

class CreditTypePage extends StatefulWidget {
  const CreditTypePage({super.key});

  @override
  State<CreditTypePage> createState() => _CreditTypePageState();
}

class _CreditTypePageState extends State<CreditTypePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/background/background.png'), fit: BoxFit.cover
            )
        ),
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 80,),
            Builder(
              builder: (context) => InkWell(
                onTap: (){
                  Scaffold.of(context).openDrawer();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset('assets/icon/menu.svg', color: Colors.white, width: 32, height: 24,),
                    SizedBox(width: 24,),
                    Text(
                        "Виды кредитов",
                        style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                                fontSize: 36,
                                color: Colors.white,
                                fontWeight: FontWeight.w600
                            )
                        )
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      drawer: CustomDrawer(1, context),
    );
  }
}
