import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../modules/supabase_bd.dart';

class EditELement extends StatefulWidget {
  const EditELement({super.key});

  @override
  State<EditELement> createState() => _EditELementState();
}

class _EditELementState extends State<EditELement> {
  var list_arg = Get.arguments;
  String? new_sum, new_day, new_month, new_year, new_date;

  @override
  Widget build(BuildContext context) {
    bool DateNotNull = new_day!=null && new_month!=null && new_year!=null;
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
                "Редактировать элемент №${list_arg[0]}",
                style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                        fontSize: 36,
                        color: Colors.white,
                        fontWeight: FontWeight.w600
                    )
                )
            ),
            Spacer(),
            Column(
              children: [
                // Сумма
                Text(
                  'Укажите сумму (тек. ${list_arg[1]})',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 20
                      )
                  ),
                ),
                Text(
                  'Если не указать, то останется текущая',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                          color: Colors.white.withOpacity(0.5),
                          fontSize: 16
                      )
                  ),
                ),
                SizedBox(height: 20),
                Container(
                    width: 300,
                    child: TextField(
                      maxLength: 10,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        hintText: list_arg[1].toString(),
                        helperText: 'Введите любое число',
                        helperMaxLines: 2,
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
                          if (value != '' && value[0] != '0') new_sum = value;
                          else new_sum = null;
                        });
                      },
                    )
                ),
                SizedBox(height: 20),

                // Дата
                Text(
                  'Укажите дату (тек. ${list_arg[2]})',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 20
                    )
                  ),
                ),
                Text(
                  'Обязательно указать все параметры или же не\nуказывать ничего (останется текущая)',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                          color: Colors.white.withOpacity(0.5),
                          fontSize: 16
                      )
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        width: 300,
                        child: TextField(
                            maxLength: 2,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              hintText: 'День',
                              helperText: 'От 1 до 31',
                              helperMaxLines: 2,
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
                                if (value != '' && value[0] != '0' && int.parse(value) < 32) {
                                  if (int.parse(value) > 9) new_day = value;
                                  else new_day = '0$value';
                                }
                                else new_day = null;
                              });
                            },
                        )
                    ),
                    SizedBox(width: 10),
                    Container(
                        width: 300,
                        child: TextField(
                          maxLength: 2,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            hintText: 'Месяц',
                            helperText: 'От 1 до 12',
                            helperMaxLines: 2,
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
                              if (value != '' && value[0] != '0' && int.parse(value) < 13)
                                if (int.parse(value) > 9) new_month = value;
                                else new_month = '0$value';
                              else new_month = null;
                            });
                          },
                        )
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Container(
                    width: 300,
                    child: TextField(
                      maxLength: 4,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        hintText: 'Год',
                        helperText: 'От 1980 до 2030',
                        helperMaxLines: 2,
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
                          if (value != '' && (int.parse(value) >= 1980) && (int.parse(value) < 2031)) new_year = value;
                          else new_year = null;
                        });
                      },
                    )
                ),
              ],
            ),
            Spacer(),
            InkWell(
              onTap: () async {
                if (DateNotNull || new_sum != null) {
                  setState(() {
                    new_sum = (new_sum == null) ? list_arg[1].toString() : new_sum;
                    if (DateNotNull)
                      new_date = '$new_day.$new_month.$new_year';
                    else new_date = list_arg[2];
                  });
                  print('here');
                  await supabaseCreditUPDATE(index: list_arg[0], new_sum: int.parse(new_sum!), new_date: new_date!);
                  Get.back();
                }
              },
              child: Container(
                height: 80,
                width: 300,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: (DateNotNull || new_sum != null) ? Colors.white : Colors.white.withOpacity(0.5),
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
