import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:postgres/postgres.dart';
import 'package:practicum_project/modules/custom_drawer.dart';

import '../modules/database.dart';


class CreditTablePage extends StatefulWidget {
  const CreditTablePage({super.key});

  @override
  State<CreditTablePage> createState() => _CreditTablePage();
}

class _CreditTablePage extends State<CreditTablePage> with SingleTickerProviderStateMixin{
  int selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  Future connect() async{
    await requestPostgres();
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    connect();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black54,
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
                        "Таблица кредитов",
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
            InkWell(
              onTap: () async {
                  for (int i = 1; i<=countCredits; i++)
                      await PostgresSELECT(table: 'credit_data', index: i);
              },
              child: Text('Click'),
            )
          ],
        ),
      ),
      drawer: CustomDrawer(0, context)
    );
  }
}

