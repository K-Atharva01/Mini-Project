import 'package:flutter/material.dart';
import 'package:flutter_adoption_miniproject/putForAdoptionScreen.dart';
import 'putForAdoptionScreen.dart';
import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_adoption_miniproject/AdoptionFormData.dart';
import 'package:flutter_adoption_miniproject/AdoptionList.dart';
import 'package:lottie/lottie.dart';
Future main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        
        title: Text("Home Page"),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 10,),
            Container(
              width: 270,
              height: 270,
              child:Lottie.asset("assets2/animations/petHug.json"),
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                SizedBox(width: 20,),
                // ElevatedButton(onPressed:(){
                //   Navigator.push(context, MaterialPageRoute(builder: (context)=>putForAdoption()));
                // }, child: Text("Put for Adoption")),
                InkWell(
                  child: Container(
                    height: 250,
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Colors.amber
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 20,),
                        Container(
                          width: 110,
                          height: 110,
                          color: Colors.red,
                        ),
                        SizedBox(height: 10,),
                        Column(
                          children: [
                            Text("Put",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                            SizedBox(height: 5,),
                            Text("For",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                            SizedBox(height: 5,),
                            Text("Adoption",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                          ],
                        ),
                      ],
                    ),
                  ),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>putForAdoption()));
                  },
                ),
                SizedBox(width: 15,),
                // ElevatedButton(onPressed:(){
                // Navigator.push(context, MaterialPageRoute(builder: (context)=>AdoptList()));
                // }, child: Text("Adopt ")),
                InkWell(
                  child: Container(
                    height: 250,
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Colors.amber
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 20,),
                        Container(
                          width: 110,
                          height: 110,
                          color: Colors.red,
                        ),
                        SizedBox(height: 20,),
                        Column(
                          children: [
                            Text("Adopt",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                            SizedBox(height: 5,),
                            Text("Animal",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                          ],
                        ),
                      ],
                    ),
                  ),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>AdoptList()));
                  },
                ),
                SizedBox(width: 10,),
              ],
            ),
          ],
        ),
      )
    );
  }
}
