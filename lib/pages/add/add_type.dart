import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../modules/database.dart';

class AddNewType extends StatefulWidget {
  const AddNewType({super.key});

  @override
  State<AddNewType> createState() => _AddNewTypeState();
}

class _AddNewTypeState extends State<AddNewType> {

  String? new_name, new_usl, new_rate, new_period;

  @override
  Widget build(BuildContext context) {
    bool allNotNull = new_name != null && new_usl != null && new_rate != null && new_period != null;
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
                "Добавить новый тип",
                style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                        fontSize: 36,
                        color: Colors.white,
                        fontWeight: FontWeight.w600
                    )
                )
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

            // Кнопки
            InkWell(
              onTap: () async {
                if (allNotNull) {
                  await conn.execute('INSERT INTO public.type(name, conditions, rate, period, id) VALUES (\'$new_name\', \'$new_usl\', $new_rate, $new_period, ${await MaxID(table: 'type') + 1})');
                  Get.back();
                }
              },
              child: Container(
                height: 80,
                width: 300,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: allNotNull ? Colors.white : Colors.white.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(20)
                ),
                child: Text(
                  'Добавить',
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
