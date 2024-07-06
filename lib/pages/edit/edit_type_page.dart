
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:practicum_project/modules/database.dart';

class EditTypePage extends StatefulWidget {
  const EditTypePage({super.key});

  @override
  State<EditTypePage> createState() => _EditTypePageState();
}

class _EditTypePageState extends State<EditTypePage> {
  var list_arg = Get.arguments;
  String? new_name, new_usl, new_rate, new_period;

  @override
  Widget build(BuildContext context) {
    bool NotNull = new_name!=null || new_usl!=null || new_rate!=null || new_period!=null;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/background/background.png'), fit: BoxFit.cover
            )
        ),
        alignment: Alignment.center,
        child: Column(
          children: [
            SizedBox(height: 80),
            Text(
                "Редактировать тип №${list_arg[0]}",
                style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                        fontSize: 36,
                        color: Colors.white,
                        fontWeight: FontWeight.w600
                    )
                )
            ),
            Text(
              'Неизменённые элементы останутся прежними',
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                      color: Colors.white.withOpacity(0.5),
                      fontSize: 16
                  )
              ),
            ),
            Spacer(),

            // название и условия
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    width: 300,
                    child: TextField(
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        hintText: 'Название',
                        helperText: 'Текущее: ${list_arg[1]}',
                        helperStyle: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                              color: Colors.white.withOpacity(0.4),
                              fontSize: 12
                          ),
                        ),
                        hintStyle: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                                color: Colors.white.withOpacity(0.4),
                                fontSize: 20
                            )
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white, width: 3,
                            ),
                            borderRadius: BorderRadius.circular(32)
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white, width: 3,
                            ),
                            borderRadius: BorderRadius.circular(32)
                        ),
                      ),
                      style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 24
                          )
                      ),
                      onChanged: (value) {
                        setState(() {
                          if (value != '') new_name = value;
                          else new_name = null;
                        });
                      },
                    )
                ),
                SizedBox(width: 10),
                Container(
                    width: 300,
                    child: TextField(
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        hintText: 'Условия',
                        helperText: 'Текущее: ${list_arg[2]}',
                        helperStyle: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                              color: Colors.white.withOpacity(0.4),
                              fontSize: 12
                          ),
                        ),
                        hintStyle: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                                color: Colors.white.withOpacity(0.4),
                                fontSize: 20
                            )
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white, width: 3,
                            ),
                            borderRadius: BorderRadius.circular(32)
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white, width: 3,
                            ),
                            borderRadius: BorderRadius.circular(32)
                        ),
                      ),
                      style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 24
                          )
                      ),
                      onChanged: (value) {
                        setState(() {
                          if (value != '' )
                            new_usl = value;
                          else new_usl = null;
                        });
                      },
                    )
                ),
              ],
            ),
            SizedBox(height: 10),

            // ставка и срок
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    width: 300,
                    child: TextField(
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        hintText: 'Ставка',
                        helperText: 'Текущее: ${list_arg[3]}%',
                        helperStyle: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                              color: Colors.white.withOpacity(0.4),
                              fontSize: 12
                          ),
                        ),
                        hintStyle: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                                color: Colors.white.withOpacity(0.4),
                                fontSize: 20
                            )
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white, width: 3,
                            ),
                            borderRadius: BorderRadius.circular(32)
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white, width: 3,
                            ),
                            borderRadius: BorderRadius.circular(32)
                        ),
                      ),
                      style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 24
                          )
                      ),
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      onChanged: (value) {
                        setState(() {
                          if (value != '') new_rate = value;
                          else new_rate = null;
                        });
                      },
                    )
                ),
                SizedBox(width: 10),
                Container(
                    width: 300,
                    child: TextField(
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        hintText: 'Срок',
                        helperText: 'Текущее: ${list_arg[4]} лет',
                        helperStyle: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                              color: Colors.white.withOpacity(0.4),
                              fontSize: 12
                          ),
                        ),
                        hintStyle: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                                color: Colors.white.withOpacity(0.4),
                                fontSize: 20
                            )
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white, width: 3,
                            ),
                            borderRadius: BorderRadius.circular(32)
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white, width: 3,
                            ),
                            borderRadius: BorderRadius.circular(32)
                        ),
                      ),
                      style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 24
                          )
                      ),
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      onChanged: (value) {
                        setState(() {
                          if (value != '')
                            new_period = value;
                          else new_period = null;
                        });
                      },
                    )
                ),
              ],
            ),
            Spacer(),

            //кнопки
            InkWell(
              onTap: () async {
                setState((){
                  new_name = new_name==null ? list_arg[1] : new_name;
                  new_usl = new_usl==null ? list_arg[2] : new_usl;
                  new_rate = new_rate==null ? list_arg[3].toString() : new_rate;
                  new_period = new_period==null ? list_arg[4].toString() : new_period;
                });
                print(list_arg[0]);
                await PostgresTypeUPDATE(index: list_arg[0], name: new_name!, usl: new_usl!, rate: int.parse(new_rate!), period: int.parse(new_period!));
                Get.back();
              },
              child: Container(
                height: 80,
                width: 300,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: NotNull ? Colors.white : Colors.white.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(20)
                ),
                child: Text(
                  'Сохранить',
                  style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                          color: Color(0xFF8292E2),
                          fontSize: 16,
                          fontWeight: FontWeight.w600

                      )
                  ),
                ),
              ),
            ),
            SizedBox(height: 24),
            InkWell(
              onTap: () => Get.back(),
              child: Text(
                'Вернуться',
                style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.white,
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600
                    )
                ),
              ),
            ),
            SizedBox(height: 80),
          ],
        ),
      ),
    );
  }
}
