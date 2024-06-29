import 'dart:async';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:postgres/legacy.dart';
import 'package:postgres/postgres.dart';


class TitlePage extends StatefulWidget {
  const TitlePage({super.key});

  @override
  State<TitlePage> createState() => _TitlePageState();
}

class _TitlePageState extends State<TitlePage> with SingleTickerProviderStateMixin{
  bool isTap = false;

  late final AnimationController _controller = AnimationController(
    duration: Duration(milliseconds: 300),
    vsync: this,
  );

  late final _colorAnimation = TweenSequence([
        TweenSequenceItem(
          tween: ColorTween(begin: Colors.white, end: Colors.grey.shade200),
          weight: 0.5,
        ),
        TweenSequenceItem(
          tween: ColorTween(begin: Colors.grey.shade200, end: Colors.white),
          weight: 0.5,
        ),
      ]
  ).animate(_controller);

  @override
  void initState() {
    super.initState();

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed)
        setState(() {
          isTap = true;
        });
      if (status == AnimationStatus.dismissed)
        setState(() {
          isTap = false;
        });
    });
  }
  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background/background.png'), fit: BoxFit.cover
          )
        ),
        alignment: Alignment.center,
        child: Column(
          children: [
            Spacer(flex: 3,),
            SvgPicture.asset('assets/icon/EvrikaIcon.svg', width: 144, height: 100,),
            Spacer(flex: 2,),
            Text(
              "Эврика Банк",
              style: GoogleFonts.montserrat(
                textStyle: TextStyle(
                  fontSize: 48,
                  color: Colors.white,
                  fontWeight: FontWeight.w600
                )
              )
            ),
            Spacer(flex: 1,),
            Container(
              width: 910,
              child: Text(
                  'Эврика Банк - это финансовый институт, который помогает своим клиентам раскрыть свой потенциал. Мы верим, что каждый человек способен достичь своих целей, и мы предоставляем инструменты и знания, чтобы сделать это возможным.',
                  textAlign: TextAlign.center,
                  softWrap: true,
                  style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.normal
                      )
                  )
              ),
            ),
            Spacer(flex: 6,),
            InkWell(
              borderRadius: BorderRadius.circular(20),
              onTap: () async {
                isTap ? _controller.reverse() : _controller.forward();
                // При нажатии должны получить данные из БД в виде списка и передать их в новый роут
                print("Conntection...");
                await requestPostgres();
              },
              child: AnimatedBuilder(
                animation: _controller,
                builder: (BuildContext context, _) {
                  return Container(
                    width: 438,
                    height: 72,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: _colorAnimation.value
                    ),
                    child: Row(
                      children: [
                        Spacer(flex: 1,),
                        SvgPicture.asset('assets/icon/DownloadCloud.svg', color: Color(0xFF8FA0BF), width: 32, height: 32,),
                        Spacer(flex: 1,),
                        VerticalDivider(width: 1, thickness: 3, color: Color(0xFF8FA0BF), indent: 15, endIndent: 15,),
                        Spacer(flex: 4,),
                        Text(
                            'Send a request',
                            style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                    fontSize: 24,
                                    color: Color(0xFF8FA0BF),
                                    fontWeight: FontWeight.w600
                                )
                            )
                        ),
                        Spacer(flex: 4,)
                      ],
                    ),
                  );
                },
              ),
            ),
            Spacer(flex: 1,),
            Text(
                isTap ? "Ожидание ответа от БД..." : "Нажмите, чтобы продолжить",
                style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                        fontSize: 16,
                        color: Colors.white.withOpacity(0.5),
                        fontWeight: FontWeight.normal
                    )
                )
            ),
            Spacer(flex: 6,),
            Text(
                "Откройте свой потенциал вместе с Эврика Банком.",
                style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.normal
                    )
                )
            ),
            Spacer(flex: 1),
          ],
        ),
      ),
    );
  }
}


Future requestPostgres() async {
  try {
    final conn = await Connection.open(Endpoint(
        host: 'localhost',
        database: 'postgres',
        username: 'postgres',
        password: 'xxxxxxx',
    ));
    Get.toNamed('/creditTable');
  } catch (e) {
    print("error: ${e.toString()}");
  }
}