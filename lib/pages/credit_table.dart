import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:practicum_project/modules/custom_drawer.dart';
import 'package:practicum_project/modules/supabase_bd.dart';



class CreditTablePage extends StatefulWidget {
  const CreditTablePage({super.key});

  @override
  State<CreditTablePage> createState() => _CreditTablePage();
}

class _CreditTablePage extends State<CreditTablePage> with SingleTickerProviderStateMixin{
  var elem = Get.arguments;
  final ScrollController _theScrollController = ScrollController();

  Future reconnecting() async{
    await requestSupabase();
    var newE = await supabaseSELECT(table: 'credit_data');
    setState((){
        elem = newE;
    });
  }
  void deleteElement({required String table, required int index}) async {
    var indexCurClient = await supabase.from('credit_data').select('user_id').eq('id', index);
    indexCurClient = indexCurClient[0]['user_id'];

    await supabaseDELETE(table: 'credit_data', index: index);
    await reconnecting();
    bool isClient = await supabaseCHECK(table: 'client_data', type_index: indexCurClient);
    if (!isClient)
      await supabaseDELETE(table: 'client_data', index: indexCurClient);
    reconnecting();
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

            // drawer
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
            SizedBox(height: 20,),

            // Таблица
            Row(
              children: [
                Spacer(),
                Container(
                  child: Text('Тип кредита',
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
                  width: 300*k,
                ),
                Spacer(),
                Container(
                  child: Text('Сумма',
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
                  width: 300*k,
                ),
                Spacer(),
                Container(
                  child: Text('Дата',
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
                  width: 300*k,
                ),
                Spacer(),
                Container(
                  child: Text('ID клиента',
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
                  width: 300*k,
                ),
                Spacer(),
              ],
            ),
            Divider(thickness: 3, color: Colors.white, indent: 80*k, endIndent: 80*k,),
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
                                Spacer(),
                                Container(
                                  child: Text('${elem[index]['type_id']}',
                                    style: GoogleFonts.montserrat(
                                        textStyle: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.normal
                                        )
                                    )
                                  ),
                                  alignment: Alignment.center,
                                  width: 300*k,
                                ),
                                Spacer(),
                                Container(
                                  child: Text('${elem[index]['sum']}',
                                      style: GoogleFonts.montserrat(
                                          textStyle: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.normal
                                          )
                                      )
                                  ),
                                  alignment: Alignment.center,
                                  width: 300*k,
                                ),
                                Spacer(),
                                Container(
                                  child: Text('${elem[index]['date']}',
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
                                  width: 300*k,
                                ),
                                Spacer(),
                                Container(
                                  child: Row(
                                    children: [
                                      Text('${elem[index]['user_id']}',
                                          style: GoogleFonts.montserrat(
                                              textStyle: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontWeight:
                                                  FontWeight.normal
                                              )
                                          )
                                      ),
                                      SizedBox(width: 80*k),
                                      Material(
                                        color: Colors.transparent,
                                        child: InkWell(
                                          borderRadius: BorderRadius.circular(8),
                                          child: SvgPicture.asset('assets/icon/garbage.svg'),
                                          onTap: () => deleteElement(table: 'credit_data', index: elem[index]['id']),
                                        ),
                                      ),
                                      SizedBox(width: 12*k),
                                      Material(
                                        color: Colors.transparent,
                                        child: InkWell(
                                          borderRadius: BorderRadius.circular(8),
                                          child: SvgPicture.asset('assets/icon/pen.svg'),
                                          onTap: () => Get.toNamed('/editcredit', arguments: [elem[index]['id'], elem[index]['sum'], elem[index]['date']]),
                                        ),
                                      ),
                                    ],
                                    mainAxisAlignment: MainAxisAlignment.end,
                                  ),
                                  width: 300*k,
                                ),
                                Spacer(),
                              ],
                            ),
                            Divider(thickness: 1, color: Colors.white, indent: 80*k, endIndent: 80*k,)
                          ],
                        );
                      }
                  ),
                )
            ),
            SizedBox(height: 100),

            // Кнопки
            InkWell(
              onTap: () => Get.toNamed('/newcredit'),
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

