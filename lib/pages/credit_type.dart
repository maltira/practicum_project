import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:practicum_project/modules/database.dart';

import '../modules/custom_drawer.dart';

class CreditTypePage extends StatefulWidget {
  const CreditTypePage({super.key});

  @override
  State<CreditTypePage> createState() => _CreditTypePageState();
}

class _CreditTypePageState extends State<CreditTypePage> {
  final ScrollController _theScrollController = ScrollController();
  var elem = Get.arguments;

  Future reconnecting() async{
    await requestPostgres();
    var newE = await PostgresSELECT(table: 'type');
    setState((){
      elem = newE;
    });
  }
  void deleteElement({required String table, required int index}) async {
    await PostgresDELETE(table: 'type', index: index);
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
            // drawer
            SizedBox(height: 80),
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
            SizedBox(height: 40),

            // Таблица
            Row(
              children: [
                Spacer(flex: 22,),
                Text('Код вида',
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
                Text('Название',
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
                Text('Условия',
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
                Text('Ставка',
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
                Text('Срок',
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
            Divider(thickness: 3, color: Colors.white, indent: 330, endIndent: 330,),
            Expanded(
                child: Scrollbar(
                  thumbVisibility: true,
                  trackVisibility: true,
                  thickness: 3,
                  controller: _theScrollController,
                  child: ListView.builder(
                      controller: _theScrollController,
                      itemCount: countTypes,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Row(
                              children: [
                                SizedBox(width: 390,),
                                Container(
                                  child: Text('${elem[index][4]}',
                                      style: GoogleFonts.montserrat(
                                          textStyle: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.normal
                                          )
                                      )
                                  ),
                                  width: 40,
                                  alignment: Alignment.center,
                                ),
                                SizedBox(width: 175,),
                                Container(
                                  child: Text('${elem[index][0]}',
                                      style: GoogleFonts.montserrat(
                                          textStyle: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.normal
                                          )
                                      )
                                  ),
                                  width: 150,
                                  alignment: Alignment.center,
                                ),
                                SizedBox(width: 130,),
                                Container(
                                  child: Text('${elem[index][1]}',
                                      style: GoogleFonts.montserrat(
                                          textStyle: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight:
                                              FontWeight.normal
                                          )
                                      )
                                  ),
                                  width: 200,
                                  alignment: Alignment.center,
                                ),
                                SizedBox(width: 145,),
                                Container(
                                  child: Text('${elem[index][2]}%',
                                      style: GoogleFonts.montserrat(
                                          textStyle: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight:
                                              FontWeight.normal
                                          )
                                      )
                                  ),
                                  width: 50,
                                  alignment: Alignment.center,
                                ),
                                SizedBox(width: 205,),
                                Container(
                                  child: Text('${elem[index][3]}',
                                      style: GoogleFonts.montserrat(
                                          textStyle: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight:
                                              FontWeight.normal
                                          )
                                      )
                                  ),
                                  width: 50,
                                  alignment: Alignment.center,
                                ),
                                SizedBox(width: 70),
                                Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(8),
                                    child: SvgPicture.asset('assets/icon/garbage.svg'),
                                    onTap: () async {
                                      bool elementUsed = await PostgresCheck(table: 'type', type_index: elem[index][4]);
                                      print(elementUsed);
                                      if (!elementUsed) {
                                        deleteElement(table: 'type', index: elem[index][4]);
                                        print('delete');
                                      }
                                      else {
                                        print('can not delete');
                                        Get.defaultDialog(
                                          title: 'ERROR',
                                          titleStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                          middleText: 'Данный тип невозможно удалить,\nтак как он ещё используется',
                                          middleTextStyle: TextStyle(color: Colors.white),
                                          backgroundColor: Colors.red
                                        );
                                      }
                                    }
                                  ),
                                ),
                                SizedBox(width: 12,),
                                Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(8),
                                    child: SvgPicture.asset('assets/icon/pen.svg'),
                                    onTap: () => Get.toNamed('/edittype', arguments: [elem[index][4], elem[index][0], elem[index][1], elem[index][2], elem[index][3]]),
                                  ),
                                ),
                                Spacer(flex: 4,),
                              ],
                            ),
                            Divider(thickness: 1, color: Colors.white, indent: 330, endIndent: 330,)
                          ],
                        );
                      }
                  ),
                )
            ),

            //Кнопки
            SizedBox(height: 100),
            InkWell(
              onTap: (){Get.toNamed('/newtype');},
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
      drawer: CustomDrawer(1, context),
    );
  }
}
