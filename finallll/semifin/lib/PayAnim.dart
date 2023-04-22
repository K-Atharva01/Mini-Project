import 'dart:async';
import 'package:lottie/lottie.dart';
import 'package:semifin/Begin.dart';
import 'package:semifin/CartAnim2.dart';
import 'package:semifin/PayPage.dart';
import 'package:semifin/screen.dart';
import 'package:flutter/material.dart';

class NoGlowBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
    BuildContext context, 
    Widget child, 
    AxisDirection axisDirection
  ) {
    return child;
  }
}

class PayAnim extends StatefulWidget {
  const PayAnim({Key? key}) : super(key: key);

  @override
  State<PayAnim> createState() => _PayAnimState();
}

class _PayAnimState extends State<PayAnim> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(milliseconds: 3000), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => ScrollConfiguration(
              behavior: NoGlowBehavior(),
              child: const Screen()),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Center(
          child: Lottie.asset('lib/animations/pay.json'),
        ),
        
      ),
      

    );
  }
}
