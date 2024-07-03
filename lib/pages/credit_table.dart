import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:practicum_project/modules/custom_drawer.dart';

import '../modules/database.dart';


class CreditTablePage extends StatefulWidget {
  const CreditTablePage({super.key});

  @override
  State<CreditTablePage> createState() => _CreditTablePage();
}

class _CreditTablePage extends State<CreditTablePage> with SingleTickerProviderStateMixin{
  var elem = Get.arguments;
  final ScrollController _theScrollController = ScrollController();

  Future reconnecting() async{
    await requestPostgres();
    var newE = await PostgresSELECT(table: 'credit_data');
    setState((){
        elem = newE;
    });
  }
  void deleteElement({required String table, required int index}) async {
    await PostgresDELETE(table: 'credit_data', index: index);
    reconnecting();
  }

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
            SizedBox(height: 40,),
            Row(
              children: [
                Spacer(flex: 22,),
                Text('Тип кредита',
                    style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight:
                            FontWeight.w600
                        )
                    )
                ),
                Spacer(flex: 11,),
                Text('Сумма',
                    style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight:
                            FontWeight.w600
                        )
                    )
                ),
                Spacer(flex: 13,),
                Text('Дата',
                    style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight:
                            FontWeight.w600
                        )
                    )
                ),
                Spacer(flex: 12,),
                Text('ID клиента',
                    style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight:
                            FontWeight.w600
                        )
                    )
                ),
                Spacer(flex: 23,)
              ],
            ),
            Divider(thickness: 3, color: Colors.white, indent: 370, endIndent: 370,),
            Expanded(
                child: Scrollbar(
                  thumbVisibility: true,
                  trackVisibility: true,
                  thickness: 3,
                  controller: _theScrollController,
                  child: ListView.builder(
                      controller: _theScrollController,
                      itemCount: countCredits,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Row(
                              children: [
                                Spacer(flex: 5,),
                                Text('${elem[index][3]}',
                                  style: GoogleFonts.montserrat(
                                      textStyle: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal
                                      )
                                  )
                                ),
                                Spacer(flex: 2,),
                                Text('${elem[index][0]}',
                                    style: GoogleFonts.montserrat(
                                        textStyle: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.normal
                                        )
                                    )
                                ),
                                Spacer(flex: 2,),
                                Text('${elem[index][1]}',
                                    style: GoogleFonts.montserrat(
                                        textStyle: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight:
                                            FontWeight.normal
                                        )
                                    )
                                ),
                                Spacer(flex: 3,),
                                Text('${elem[index][2]}',
                                    style: GoogleFonts.montserrat(
                                        textStyle: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight:
                                            FontWeight.normal
                                        )
                                    )
                                ),
                                SizedBox(width: 100),
                                Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(8),
                                    child: SvgPicture.asset('assets/icon/garbage.svg'),
                                    onTap: () => deleteElement(table: 'credit_data', index: index+1),
                                  ),
                                ),
                                SizedBox(width: 12,),
                                Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(8),
                                    child: SvgPicture.asset('assets/icon/pen.svg'),
                                    onTap: () => Get.toNamed('/edit', arguments: [index+1, elem[index][0], elem[index][1]]),
                                  ),
                                ),
                                Spacer(flex: 4,),
                              ],
                            ),
                            Divider(thickness: 1, color: Colors.white, indent: 370, endIndent: 370,)
                          ],
                        );
                      }
                  ),
                )
            ),
            SizedBox(height: 100),
            InkWell(
              onTap: (){},
              child: Container(
                width: 160,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(32)
                ),
                child: Icon(Icons.add, color: Color(0xFF8292E2), size: 48,),
              ),
            ),
            SizedBox(height: 80),
            Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(32),
                onTap: () => reconnecting(),
                child: Container(
                  width: 300,
                  height: 80,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.update, color: Colors.white, size: 32),
                      SizedBox(width: 14,),
                      Text(
                        'Update the data',
                        style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600
                          )
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
      drawer: CustomDrawer(0, context)
    );
  }
}

