import 'package:flutter/material.dart';

class Dog7screen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lucy"),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
              height: 250,
              width: 250,
              child: CircleAvatar(
                backgroundImage: AssetImage("assets/images/Dog7.jpg"),
              )
            ),
            ],
          ),
          Container(
              height: 10,
              //color: Colors.green,
            ),
            Container(
              height: 80,
              //color: Colors.blue,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Text("Lucy",style: TextStyle(fontSize: 30,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold),)],
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Icon(Icons.gps_fixed),
                      SizedBox(
                        width: 10,
                      ),
                      Text("Dombivali, Thane Dist.",style: TextStyle(fontSize: 30,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold),)],
                  ),
                ],
              ),
            ),
            Container(
              height: 10,
              //color: Colors.green,
            ),
            Container(
              height: 80,
              //color: Colors.blue,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Card(
                      color: Colors.white54,
                      shadowColor: Colors.blueGrey,
                      child: Container(
                        width: 100,
                        //color: Colors.orange,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Text("Gender",style: TextStyle(fontSize: 20,color: Colors.blueGrey,fontWeight: FontWeight.bold),),
                            SizedBox(
                              height: 5,
                            ),
                            Text("Female",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                          ],
                        )
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Card(
                      color: Colors.white54,
                      shadowColor: Colors.blueGrey,
                      child: Container(
                        width: 100,
                        //color: Colors.red,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Text("Color",style: TextStyle(fontSize: 20,color: Colors.blueGrey,fontWeight: FontWeight.bold),),
                            SizedBox(
                              height: 5,
                            ),
                            Text("Brown",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                          ],
                        )
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Card(
                      color: Colors.white54,
                      shadowColor: Colors.blueGrey,
                      child: Container(
                        width: 100,
                        //color: Colors.orange,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Text("Age",style: TextStyle(fontSize: 20,color: Colors.blueGrey,fontWeight: FontWeight.bold),),
                            SizedBox(
                              height: 5,
                            ),
                            Text("6 Mths",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                          ],
                        )
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Card(
                      color: Colors.white54,
                      shadowColor: Colors.blueGrey,
                      child: Container(
                        width: 100,
                        //color: Colors.red,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Text("Weight",style: TextStyle(fontSize: 20,color: Colors.blueGrey,fontWeight: FontWeight.bold),),
                            SizedBox(
                              height: 5,
                            ),
                            Text("6 kg",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                          ],
                        )
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 9,
              //color: Colors.green,
            ),
            Container(
              height: 1,
              color: Colors.black,
            ),
            Container(
              height: 70,
              //color: Colors.orange,
              child: Row(
                children: [
                  SizedBox(
                    width: 15,
                  ),
                  Icon(Icons.person,size: 40,),
                  SizedBox(
                    width: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text("Rajan Rane",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700),),
                      SizedBox(
                        height: 5,
                      ),
                      Text("Mulund, Mumbai",style: TextStyle(fontSize: 15),),
                    ],
                  ),
                  SizedBox(
                    width: 120,
                  ),
                  IconButton(onPressed:(){}, icon: Icon(Icons.call))
                ],
              ),
            ),
            Container(
              height: 1,
              color: Colors.black,
            ),
            Container(
              height: 9,
              //color: Colors.green,
            ),
            Container(
              height: 50,
              //color: Colors.red
              child: Row(
                children: [
                  SizedBox(
                    width: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.favorite,size: 40,),
                  ),
                  SizedBox(
                    width: 140
                  ),
                  ElevatedButton(
                    onPressed: (){}, 
                    child:Text("Adopt"),),
                ],
              ),
            )
        ],
      )
    );
  }

}