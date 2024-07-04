
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:postgres/postgres.dart';
import 'package:practicum_project/modules/database.dart';

class AddNewCredit extends StatefulWidget {
  const AddNewCredit({super.key});

  @override
  State<AddNewCredit> createState() => _AddNewCreditState();
}

class _AddNewCreditState extends State<AddNewCredit> {
  String? new_name, new_own, new_address, new_phone, new_person;
  String? new_sum, new_day, new_month, new_year, new_date;
  var typeCredit = 'Вид кредита';
  List<String> allTypeCredits = [];
  List perm = [];

  void getTypes() async {
    perm = await PostgresSELECT(table: 'type');
    for (int i = 0; i<countTypes;i++){
      allTypeCredits.add(perm[i][4].toString());
    }
  }
  @override
  void initState() {
    super.initState();
    getTypes();
  }

  @override
  Widget build(BuildContext context) {
    bool allNotNull = new_name!=null && new_own!=null && new_address!=null && new_phone!=null && new_person!=null && new_sum!=null && new_day!=null && new_month!=null && new_year!=null && typeCredit!='Вид кредита';
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
                "Новый кредит",
                style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                        fontSize: 36,
                        color: Colors.white,
                        fontWeight: FontWeight.w600
                    )
                )
            ),

            //Данные о клиенте
            SizedBox(height: 20),
            Text(
              'Данные о клиенте',
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 20
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
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        hintText: 'Название',
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
                              fontSize: 20
                          )
                      ),
                      onChanged: (value) {
                        setState(() {
                          if (value != '') {
                            new_name = value;
                          }
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
                        hintText: 'Вид собственности',
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
                              fontSize: 20
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
                SizedBox(width: 10),
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
                              fontSize: 20
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
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    width: 300,
                    child: TextField(
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        hintText: 'Телефон',
                        helperText: 'Формат 89009009090',
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
                              fontSize: 20
                          )
                      ),
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
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
                SizedBox(width: 10),
                Container(
                    width: 300,
                    child: TextField(
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        hintText: 'Контактное лицо',
                        helperText: 'Полностью ФИО',
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
              ],
            ),
            SizedBox(height: 10),

            //Данные о кредите
            SizedBox(height: 20),
            Text(
              'Данные о кредите',
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 20
                  )
              ),
            ),
            SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    width: 300,
                    child: TextField(
                      maxLength: 10,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        hintText: 'Сумма',
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
                          if (value != '' && value[0] != '0') {
                            new_sum = value;
                          }
                          else new_sum = null;
                        });
                      },
                    )
                ),
                SizedBox(width: 10),
                InkWell(
                  onTap: (){
                    Get.defaultDialog(
                      title: 'Вид кредита',
                      backgroundColor: Colors.white,
                      textCancel: 'Вернуться',
                      content: Container(
                        child: DropdownMenu(
                          initialSelection: typeCredit,
                          onSelected: (value){
                            setState(() {
                              typeCredit = value!;
                              print(typeCredit);
                            });
                          },
                          dropdownMenuEntries: allTypeCredits.map((item) {
                            return DropdownMenuEntry(value: item, label: item);
                          }).toList()
                        ),
                      ),
                    );
                  },
                  child: Container(
                    width: 300,
                    height: 50,
                    margin: EdgeInsets.only(bottom: 24),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(32)
                    ),
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Вид кредита', textAlign: TextAlign.center, style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                                color: Color(0xFF8292E2),
                                fontSize: 20,
                                fontWeight: FontWeight.w600
                            )
                        ),),
                        SizedBox(width: 12),
                        SvgPicture.asset('assets/icon/pen.svg', color: Color(0xFF8292E2), width: 24, height: 24,)
                      ],
                    )
                  ),
                )
              ],
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
                          if (value != '' && int.parse(value) < 32 && value[0] != '0') {
                            if (int.parse(value) > 9) new_day = value;
                            else new_day = '0$new_day';
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
            Spacer(),

            // Кнопки
            InkWell(
              onTap: () async {
                if (allNotNull) {
                  setState(() {
                    new_date = "$new_day.$new_month.$new_year";
                  });
                  print(await MaxID(table: 'user_data') + 1);
                  print(countCredits);
                  await conn.execute('INSERT INTO public.user_data(company_name, type_of_ownership, address, phone_number, contact_person, id) VALUES (\'$new_name\', \'$new_own\', \'$new_address\', \'$new_phone\', \'$new_person\', ${await MaxID(table: 'user_data') + 1})');
                  await conn.execute('INSERT INTO public.credit_data(summ, date, user_id, type_id, id) VALUES ($new_sum, \'$new_date\', ${await MaxID(table: 'user_data')+1}, ${int.parse(typeCredit)}, ${countCredits+1})');
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
            Spacer()
          ],
        ),
      ),
    );
  }
}
