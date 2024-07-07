
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
    double k = MediaQuery.of(context).size.width/1920;
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
                Spacer(),
                Container(
                  child: Text('Код клиента',
                      style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight:
                              FontWeight.w600
                          )
                      )
                  ),
                  alignment: Alignment.center,
                  width: 150*k,
                ),
                Spacer(),
                Container(
                  child: Text('Название',
                      style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight:
                              FontWeight.w600
                          )
                      )
                  ),
                  alignment: Alignment.center,
                  width: 280*k,
                ),
                Spacer(),
                Container(
                  child: Text('Вид собственности',
                      style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight:
                              FontWeight.w600
                          )
                      )
                  ),
                  alignment: Alignment.center,
                  width: 280*k,
                ),
                Spacer(),
                Container(
                  child: Text('Адрес',
                      style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight:
                              FontWeight.w600
                          )
                      )
                  ),
                  alignment: Alignment.center,
                  width: 250*k,
                ),
                Spacer(),
                Container(
                  child: Text('Телефон',
                      style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight:
                              FontWeight.w600
                          )
                      )
                  ),
                  alignment: Alignment.center,
                  width: 200*k,
                ),
                Spacer(),
                Container(
                  child: Text('Контактное лицо',
                      style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight:
                              FontWeight.w600
                          )
                      )
                  ),
                  alignment: Alignment.center,
                  width: 250*k,
                ),
                Spacer(),
              ],
            ),
            Divider(thickness: 3, color: Colors.white, indent: 25, endIndent: 25),
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
                                Spacer(),
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
                                  width: 150*k,
                                  alignment: Alignment.center,
                                ),
                                Spacer(),
                                Container(
                                  width: 280*k,
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
                                Spacer(),
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
                                  width: 280*k,
                                  alignment: Alignment.center,
                                ),
                                Spacer(),
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
                                  width: 250*k,
                                  alignment: Alignment.center,
                                ),
                                Spacer(),
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
                                  width: 200*k,
                                ),
                                Spacer(),
                                Container(
                                  child: Row(
                                    children: [
                                      Text('${elem[index][4]}',
                                          style: GoogleFonts.montserrat(
                                              textStyle: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontWeight:
                                                  FontWeight.normal,
                                              )
                                          )
                                      ),
                                      SizedBox(width: 60*k),
                                      Material(
                                        color: Colors.transparent,
                                        child: InkWell(
                                          borderRadius: BorderRadius.circular(8),
                                          child: SvgPicture.asset('assets/icon/pen.svg'),
                                          onTap: () => Get.toNamed('/editclient', arguments: [elem[index][5], elem[index][0], elem[index][1], elem[index][2], elem[index][3],  elem[index][4]]),
                                        ),
                                      ),
                                    ],
                                    mainAxisAlignment: MainAxisAlignment.end,
                                  ),
                                  width: 250*k,
                                ),
                                Spacer(),
                              ],
                            ),
                            Divider(thickness: 1, color: Colors.white, indent: 25, endIndent: 25,)
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
