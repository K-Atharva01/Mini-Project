import 'package:flutter/material.dart';
import 'package:adoption_page/Dog1.dart';
import 'package:adoption_page/Dog2.dart';
import 'package:adoption_page/Dog3.dart';
import 'package:adoption_page/Dog4.dart';
import 'package:adoption_page/Dog5.dart';
import 'package:adoption_page/Dog6.dart';
import 'package:adoption_page/Dog7.dart';
import 'package:adoption_page/Dog8.dart';
void main() {
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
  var index=0;
  var arrGender=["Male","Female","Male","Male","Male","Female","Female","Male"];
  var arrNames=["Jack","Lola","Rockey","Ace","Leo","Kio","Lucy","Diesel"];
  var arrAges=["3 Months","3 Months","4 Months","2 Months","4 Months","4 Months","6 Months","5 Months"];
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        
        title: Text("Dogs"),
      ),
      body: SingleChildScrollView(
        
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            InkWell(
              child: Card(
                shadowColor: Colors.blueGrey,
                elevation: 20,
                color: Colors.white60,
                child: Container(
                  height: 200,
                  //color: Colors.orange,
                  child: Row(
                    children: [
                      Container(
                        width: 180,
                        //color: Colors.red,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset("assets/images/Dog1.jpg"),
                        ),
                      ),
                      Container(
                        width: 5,
                        //color: Colors.green,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 149,
                          //color: Colors.black,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0,top: 4.0),
                              child: Text("Name : ${arrNames[index]}",style: TextStyle(fontSize:20 ),),
                            ),
                            Container(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0,top: 4.0),
                              child: Text("Gender : ${arrGender[index]}",style: TextStyle(fontSize:20 ),),
                            ),
                            Container(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0,top: 4.0),
                              child: Text("Age : ${arrAges[index]}",style: TextStyle(fontSize:20 ),),
                            ),
                          ],
                        ),
                        ),
                      )
                    ],
                  )
                ),
              ),
              onTap: (){
                //Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Dog1screen()));
                Navigator.push(context, MaterialPageRoute(builder: ((context) => Dog1screen())));
              },
            ),
            Container(
              height: 10,
              //color: Colors.orange,
            ),
            InkWell(
              child: Card(
                shadowColor: Colors.blueGrey,
                elevation: 20,
                color: Colors.white60,
                child: Container(
                  height: 200,
                  //color: Colors.pink,
                  child: Row(
                    children: [
                      Container(
                        width: 180,
                        //color: Colors.orange,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset("assets/images/Dog2.jpg"),
                        ),
                      ),
                      Container(
                        width: 5,
                        //color: Colors.green,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 149,
                          //color: Colors.black,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0,top: 4.0),
                              child: Text("Name : ${arrNames[index+1]}",style: TextStyle(fontSize:20 ),),
                            ),
                            Container(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0,top: 4.0),
                              child: Text("Gender : ${arrGender[index+1]}",style: TextStyle(fontSize:20 ),),
                            ),
                            Container(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0,top: 4.0),
                              child: Text("Age : ${arrAges[index+1]}",style: TextStyle(fontSize:20 ),),
                            ),
                          ],
                        ),
                        ),
                      )
                      
                    ],
                  )
                ),
              ),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: ((context) => Dog2screen())));
              },
            ),
             Container(
              height: 10,
              //color: Colors.orange,
            ),
            InkWell(
              child: Card(
                shadowColor: Colors.blueGrey,
                elevation: 20,
                color: Colors.white60,
                child: Container(
                  height: 200,
                  //color: Colors.green,
                  child: Row(
                    children: [
                      Container(
                        width: 180,
                        //color: Colors.red,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset("assets/images/Dog3.jpg"),
                        ),
                      ),
                      Container(
                        width: 5,
                        //color: Colors.green,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 149,
                          //color: Colors.black,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0,top: 4.0),
                              child: Text("Name : ${arrNames[index+2]}",style: TextStyle(fontSize:20 ),),
                            ),
                            Container(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0,top: 4.0),
                              child: Text("Gender : ${arrGender[index+2]}",style: TextStyle(fontSize:20 ),),
                            ),
                            Container(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0,top: 4.0),
                              child: Text("Age : ${arrAges[index+2]}",style: TextStyle(fontSize:20 ),),
                            ),
                          ],
                        ),
                        ),
                      )
                    ],
                  )
                ),
              ),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: ((context) => Dog3screen())));
              },
            ),
             Container(
              height: 10,
              //color: Colors.orange,
            ),
            InkWell(
              child: Card(
                shadowColor: Colors.blueGrey,
                elevation: 20,
                color: Colors.white60,
                child: Container(
                  height: 200,
                  //color: Colors.red
                  child: Row(
                    children: [
                      Container(
                        width: 180,
                        //color: Colors.red,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset("assets/images/Dog4.jpg"),
                        ),
                      ),
                      Container(
                        width: 5,
                        //color: Colors.green,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 149,
                          //color: Colors.black,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0,top: 4.0),
                              child: Text("Name : ${arrNames[index+3]}",style: TextStyle(fontSize:20 ),),
                            ),
                            Container(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0,top: 4.0),
                              child: Text("Gender : ${arrGender[index+3]}",style: TextStyle(fontSize:20 ),),
                            ),
                            Container(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0,top: 4.0),
                              child: Text("Age : ${arrAges[index+3]}",style: TextStyle(fontSize:20 ),),
                            ),
                          ],
                        ),
                        ),
                      )
                    ],
                  )
                ),
              ),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: ((context) => Dog4screen())));
              },
            ),
             Container(
              height: 10,
              //color: Colors.orange,
            ),
            InkWell(
              child: Card(
                shadowColor: Colors.blueGrey,
                elevation: 20,
                color: Colors.white60,
                child: Container(
                  height: 200,
                  //color: Colors.orange
                  child: Row(
                    children: [
                      Container(
                        width: 180,
                        //color: Colors.red,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset("assets/images/Dog5.jpg"),
                        ),
                      ),
                      Container(
                        width: 5,
                       // color: Colors.green,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 149,
                          //color: Colors.black,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0,top: 4.0),
                              child: Text("Name : ${arrNames[index+4]}",style: TextStyle(fontSize:20 ),),
                            ),
                            Container(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0,top: 4.0),
                              child: Text("Gender : ${arrGender[index+4]}",style: TextStyle(fontSize:20 ),),
                            ),
                            Container(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0,top: 4.0),
                              child: Text("Age : ${arrAges[index+4]}",style: TextStyle(fontSize:20 ),),
                            ),
                          ],
                        ),
                        ),
                      )
                    ],
                  )
                ),
              ),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: ((context) => Dog5screen())));
              },
            ),
             Container(
              height: 10,
              //color: Colors.orange,
            ),
            InkWell(
              child: Card(
                shadowColor: Colors.blueGrey,
                elevation: 20,
                color: Colors.white60,
                child: Container(
                  height: 200,
                  //color: Colors.pink
                  child: Row(
                    children: [
                      Container(
                        width: 180,
                        //color: Colors.red,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset("assets/images/Dog6.jpg"),
                        ),
                      ),
                      Container(
                        width: 5,
                        //color: Colors.green,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 149,
                          //color: Colors.black,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0,top: 4.0),
                              child: Text("Name : ${arrNames[index+5]}",style: TextStyle(fontSize:20 ),),
                            ),
                            Container(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0,top: 4.0),
                              child: Text("Gender : ${arrGender[index+5]}",style: TextStyle(fontSize:20 ),),
                            ),
                            Container(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0,top: 4.0),
                              child: Text("Age : ${arrAges[index+5]}",style: TextStyle(fontSize:20 ),),
                            ),
                          ],
                        ),
                        ),
                      )
                    ],
                  )
                ),
              ),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: ((context) => Dog6screen())));
              },
            ),
             Container(
              height: 10,
              //color: Colors.orange,
            ),
            InkWell(
              child: Card(
                shadowColor: Colors.blueGrey,
                elevation: 20,
                color: Colors.white60,
                child: Container(
                  height: 200,
                  //color: Colors.green
                  child: Row(
                    children: [
                      Container(
                        width: 180,
                        //color: Colors.red,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset("assets/images/Dog7.jpg"),
                        ),
                      ),
                      Container(
                        width: 5,
                        //color: Colors.green,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 149,
                          //color: Colors.black,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0,top: 4.0),
                              child: Text("Name : ${arrNames[index+6]}",style: TextStyle(fontSize:20 ),),
                            ),
                            Container(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0,top: 4.0),
                              child: Text("Gender : ${arrGender[index+6]}",style: TextStyle(fontSize:20 ),),
                            ),
                            Container(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0,top: 4.0),
                              child: Text("Age : ${arrAges[index+6]}",style: TextStyle(fontSize:20 ),),
                            ),
                          ],
                        ),
                        ),
                      )
                    ],
                  )
                ),
              ),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: ((context) => Dog7screen())));
              },
            ),
             Container(
              height: 10,
              //color: Colors.orange,
            ),
            InkWell(
              child: Card(
                shadowColor: Colors.blueGrey,
                elevation: 20,
                color: Colors.white60,
                child: Container(
                  height: 200,
                  //color: Colors.pink
                  child: Row(
                    children: [
                      Container(
                        width: 180,
                        //color: Colors.red,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset("assets/images/Dog8.jpg"),
                        ),
                      ),
                      Container(
                        width:5,
                        //color: Colors.green,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 149,
                          //color: Colors.black,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0,top: 4.0),
                              child: Text("Name : ${arrNames[index+7]}",style: TextStyle(fontSize:20 ),),
                            ),
                            Container(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0,top: 4.0),
                              child: Text("Gender : ${arrGender[index+7]}",style: TextStyle(fontSize:20 ),),
                            ),
                            Container(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0,top: 4.0),
                              child: Text("Age : ${arrAges[index+7]}",style: TextStyle(fontSize:20 ),),
                            ),
                          ],
                        ),
                        ),
                      )
                    ],
                  )
                ),
              ),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: ((context) => Dog8screen())));
              },
            ),
          ],
        ),
      )
    );
  }
}
