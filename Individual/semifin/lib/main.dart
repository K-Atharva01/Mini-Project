import 'package:flutter/material.dart';
import 'package:semifin/adminhome.dart';
import 'package:semifin/adminreg.dart';
import 'package:semifin/authcontroller.dart';
import 'package:semifin/details.dart';
import 'package:semifin/example.dart';
import 'splash1.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.put(AuthController());
    return MaterialApp(

      title: 'Flutter App',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: splash1(),
      debugShowCheckedModeBanner: false,
    );
  }
}