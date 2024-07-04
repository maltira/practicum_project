
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:practicum_project/modules/custom_drawer.dart';
import 'package:practicum_project/modules/database.dart';

class ClientPage extends StatefulWidget {
  const ClientPage({super.key});

  @override
  State<ClientPage> createState() => _ClientPageState();
}

class _ClientPageState extends State<ClientPage> {
  var elem = Get.arguments;

  final ScrollController _theScrollController = ScrollController();


  Future reconnecting() async{
    await requestPostgres();
    var newE = await PostgresSELECT(table: 'user_data');
    setState((){
      elem = newE;
    });
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
                        "Клиенты",
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
                SizedBox(width: 230,),
                Text('Код клиента',
                    style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight:
                            FontWeight.w600
                        )
                    )
                ),
                SizedBox(width: 125,),
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
                SizedBox(width: 165,),
                Text('Вид собственности',
                    style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight:
                            FontWeight.w600
                        )
                    )
                ),
                SizedBox(width: 140,),
                Text('Адрес',
                    style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight:
                            FontWeight.w600
                        )
                    )
                ),
                SizedBox(width: 150,),
                Text('Телефон',
                    style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight:
                            FontWeight.w600
                        )
                    )
                ),
                SizedBox(width: 150,),
                Text('Контактное лицо',
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
            Divider(thickness: 3, color: Colors.white, indent: 190, endIndent: 190),
            Expanded(
                child: Scrollbar(
                  thumbVisibility: true,
                  trackVisibility: true,
                  thickness: 3,
                  controller: _theScrollController,
                  child: ListView.builder(
                      controller: _theScrollController,
                      itemCount: countClients,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Row(
                              children: [
                                SizedBox(width: 260,),
                                Container(
                                  child: Text('${elem[index][5]}',
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
                                SizedBox(width: 85,),
                                Container(
                                  width: 240,
                                  child: Text('${elem[index][0]}',
                                      style: GoogleFonts.montserrat(
                                          textStyle: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.normal
                                          )
                                      )
                                  ),
                                  alignment: Alignment.center,
                                ),
                                SizedBox(width: 75,),
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
                                SizedBox(width: 65,),
                                Container(
                                  child: Text('${elem[index][2]}',
                                      style: GoogleFonts.montserrat(
                                          textStyle: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight:
                                              FontWeight.normal
                                          )
                                      )
                                  ),
                                  width: 180,
                                  alignment: Alignment.center,
                                ),
                                SizedBox(width: 25,),
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
                                  alignment: Alignment.center,
                                  width: 200,
                                ),
                                SizedBox(width: 20,),
                                Container(
                                  child: Text('${elem[index][4]}',
                                      style: GoogleFonts.montserrat(
                                          textStyle: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight:
                                              FontWeight.normal
                                          )
                                      )
                                  ),
                                  width: 300,
                                  alignment: Alignment.center,
                                ),
                                SizedBox(width: 45),
                                Container(
                                  child: Material(
                                    color: Colors.transparent,
                                    child: InkWell(
                                      borderRadius: BorderRadius.circular(8),
                                      child: SvgPicture.asset('assets/icon/pen.svg'),
                                      onTap: () => Get.toNamed('/editclient', arguments: [elem[index][5], elem[index][0], elem[index][1], elem[index][2], elem[index][3],  elem[index][4]]),
                                    ),
                                  ),
                                  width: 32,
                                ),
                              ],
                            ),
                            Divider(thickness: 1, color: Colors.white, indent: 190, endIndent: 190,)
                          ],
                        );
                      }
                  ),
                )
            ),

            //кнопки
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
      drawer: CustomDrawer(2, context),
    );
  }
}
