
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../modules/database.dart';
import '../../modules/supabase_bd.dart';

class EditClientPage extends StatefulWidget {
  const EditClientPage({super.key});

  @override
  State<EditClientPage> createState() => _EditClientPageState();
}

class _EditClientPageState extends State<EditClientPage> {
  List list_arg = Get.arguments;
  String? new_name, new_own, new_address, new_phone, new_person;

  @override
  Widget build(BuildContext context) {
    bool NotNull = new_name!=null || new_own != null || new_address!=null || new_phone!=null || new_person!=null;
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
                "Редактировать данные клиента №${list_arg[0]}",
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

            // название и собственность
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    width: 300,
                    child: TextField(
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        hintText: 'Название',
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
                        hintText: 'Тип собственности',
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
                          if (value != '') {
                            new_own = value;
                          }
                          else new_own= null;
                        });
                      },
                    )
                ),
              ],
            ),
            SizedBox(height: 10),

            // адрес и телефон
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    width: 300,
                    child: TextField(
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        hintText: 'Адрес',
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
                          if (value != '') {
                            new_address = value;
                          }
                          else new_address = null;
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
                        hintText: 'Телефон',
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
                          if (value != '') {
                            new_phone = value;
                          }
                          else new_phone = null;
                        });
                      },
                    )
                ),
              ],
            ),
            SizedBox(height: 10),

            // контактное лицо
            Container(
                width: 300,
                child: TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: 'Контактное лицо',
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
                          fontSize: 20
                      )
                  ),
                  onChanged: (value) {
                    setState(() {
                      if (value != '') {
                        new_person = value;
                      }
                      else new_person = null;
                    });
                  },
                )
            ),
            Spacer(),

            //Кнопки
            InkWell(
              onTap: () async {
                setState((){
                  new_name = new_name==null ? list_arg[1] : new_name;
                  new_own = new_own==null ? list_arg[2] : new_own;
                  new_address = new_address==null ? list_arg[3] : new_address;
                  new_phone = new_phone==null ? list_arg[4] : new_phone;
                  new_person = new_person==null ? list_arg[5] : new_person;
                });
                await supabaseClientUPDATE(index: list_arg[0], name: new_name!, own: new_own!, address: new_address!, phone: new_phone!, person: new_person!);
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
