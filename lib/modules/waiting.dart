import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class WaitingBetweenPages extends StatelessWidget {
  const WaitingBetweenPages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(flex: 20,),
            Text("Загрузка страницы...",
              style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                    color: Color(0xFF8292E2),
                    fontWeight: FontWeight.w600,
                    fontSize: 24
                  )
              ),
            ),
            Spacer(flex: 1,),
            SpinKitFadingCircle(
              color: Color(0xFF8292E2),
              size: 64,
            ),
            Spacer(flex: 20,),
          ],
        ),
      ),
    );
  }
}
