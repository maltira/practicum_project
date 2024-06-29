import 'package:flutter/material.dart';
import 'package:postgres/postgres.dart';


class CreditTablePage extends StatefulWidget {
  const CreditTablePage({super.key});

  @override
  State<CreditTablePage> createState() => _CreditTablePage();
}

class _CreditTablePage extends State<CreditTablePage> with SingleTickerProviderStateMixin{


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
      ),
    );
  }
}