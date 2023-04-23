import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:semifin/adminhome.dart';
import 'package:semifin/adminreg.dart';
import 'package:semifin/authcontroller.dart';
import 'package:semifin/details.dart';
import 'package:semifin/example.dart';
import 'package:semifin/screen_model1.dart';
import 'fav_model.dart';
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartModel()),
        ChangeNotifierProvider(create: (_) => FavModel()),
      ],
      child: MaterialApp(

      title: 'Flutter App',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: splash1(),
      debugShowCheckedModeBanner: false,
    ),
      
    );
  
  }
}