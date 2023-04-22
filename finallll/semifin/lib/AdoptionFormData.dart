import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'main.dart';

class AdoptionData extends StatelessWidget{
  var pettype;
  var petname;
  var petage;
  var petgender;
  var petcolour;
  var image;
  var ownername;
  var ownerphone;
  var owneraddress;

  AdoptionData(
    this.pettype,
    this.petname,
    this.petage,
    this.petgender,
    this.petcolour,
    this.image,
    this.ownername,
    this.ownerphone,
    this.owneraddress,
  );
  @override
  Widget build(BuildContext context) {
    //var arr=[pettype.toString(),petname.toString(),petage.toString(),petgender.toString(),petcolour.toString(),ownername.toString(),ownerphone.toString(),owneraddress.toString()];
    return Scaffold(
      appBar: AppBar(
        
        title: Text("Adoption Form"),
      ),
      body:Container(    
        child: Column(
          children: [
            SizedBox(height: 20,),
            Row(
              children: [
                SizedBox(width: 10,),
                Card(
                  elevation: 15,
                  color: Colors.white70,
                  child: Container(
                    width: 340,
                    height: 560,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10,),
                          Row(
                            children: [
                              SizedBox(width: 10,),
                              Container(
                                width: 315,
                                height: 200,
                                child: Image.network(image),
                              )
                            ],
                          ),
                          SizedBox(height: 10,),
                          Row(
                            children: [
                              SizedBox(width: 10,),
                              Card(
                                shadowColor: Colors.black,
                                elevation: 15,
                                child: Container(
                                  height: 50,
                                  width: 305,
                                  child:Row(
                                    children: [
                                      SizedBox(width: 10,),
                                      Center(child: Text("Type Of Pet :-",style: TextStyle(fontSize: 25,),)),
                                      Center(child: Text("$pettype",style: TextStyle(fontSize: 25),))
                                    ],
                                  )
                                )
                              ),
                            ],
                          ),
                          SizedBox(height: 10,),
                          Row(
                            children: [
                              SizedBox(width: 10,),
                              Card(
                                shadowColor: Colors.black,
                                elevation: 15,
                                child: Container(
                                  height: 50,
                                  width: 305,
                                  child:Row(
                                    children: [
                                      SizedBox(width: 10,),
                                      Center(child: Text("Name Of Pet :-",style: TextStyle(fontSize: 25,),)),
                                      Center(child: Text("$petname",style: TextStyle(fontSize: 25,),))
                                    ],
                                  )
                                )
                              ),
                            ],
                          ),
                          SizedBox(height: 10,),
                          Row(
                            children: [
                              SizedBox(width: 10,),
                              Card(
                                shadowColor: Colors.black,
                                elevation: 15,
                                child: Container(
                                  height: 50,
                                  width: 305,
                                  child:Row(
                                    children: [
                                      SizedBox(width: 10,),
                                      Center(child: Text("Age Of Pet :-",style: TextStyle(fontSize: 25,),)),
                                      Center(child: Text("$petage Months",style: TextStyle(fontSize: 25,),))
                                    ],
                                  )
                                )
                              ),
                            ],
                          ),
                          SizedBox(height: 10,),
                          Row(
                            children: [
                              SizedBox(width: 10,),
                              Card(
                                shadowColor: Colors.black,
                                elevation: 15,
                                child: Container(
                                  height: 50,
                                  width: 305,
                                  child:Row(
                                    children: [
                                      SizedBox(width: 10,),
                                      Center(child: Text("Gender Of Pet :-",style: TextStyle(fontSize: 25,),)),
                                      Center(child: Text("$petgender",style: TextStyle(fontSize: 25,),))
                                    ],
                                  )
                                )
                              ),
                            ],
                          ),
                          SizedBox(height: 10,),
                          Row(
                            children: [
                              SizedBox(width: 10,),
                              Card(
                                shadowColor: Colors.black,
                                elevation: 15,
                                child: Container(
                                  height: 50,
                                  width: 305,
                                  child:Row(
                                    children: [
                                      SizedBox(width: 10,),
                                      Center(child: Text("Colour Of Pet :-",style: TextStyle(fontSize: 25,),)),
                                      Center(child: Text("$petcolour",style: TextStyle(fontSize: 25,),))
                                    ],
                                  )
                                )
                              ),
                            ],
                          ),
                          SizedBox(height: 10,),
                          Row(
                            children: [
                              SizedBox(width: 10,),
                              Card(
                                shadowColor: Colors.black,
                                elevation: 15,
                                child: Container(
                                  height: 80,
                                  width: 305,
                                  child:Row(
                                    children: [
                                      SizedBox(width: 10,),
                                      Container(
                                        width: 100,
                                        height: 100,
                                        child: Column(
                                          children: [
                                            SizedBox(height: 10,),
                                            Center(child: Text("Name Of Owner :-",style: TextStyle(fontSize: 25,),)),
                                          ],
                                        ),
                                      ),
                                      SizedBox(width: 20,),
                                      Container(
                                        width: 130,
                                        child: Center(
                                          child: Text("$ownername",style: TextStyle(fontSize: 25,),)
                                          )
                                        )
                                    ],
                                  )
                                )
                              ),
                            ],
                          ),
                          SizedBox(height: 10,),
                          Row(
                            children: [
                              SizedBox(width: 10,),
                              Card(
                                shadowColor: Colors.black,
                                elevation: 15,
                                child: Container(
                                  height: 80,
                                  width: 305,
                                  child:Row(
                                    children: [
                                      SizedBox(width: 10,),
                                      Container(
                                        width: 150,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(height: 10,),
                                            Text("Phone No",style: TextStyle(fontSize: 25,),),
                                            SizedBox(height: 5,),
                                            Text("Of Owner :-",style: TextStyle(fontSize: 25,),),
                                          ],
                                        )  
                                      ),
                                      Container(
                                        width: 130,
                                        child:Text("$ownerphone",style: TextStyle(fontSize: 23,),)
                                      )
                                    ],
                                  )
                                )
                              ),
                            ],
                          ),
                          SizedBox(height: 10,),
                          Row(
                            children: [
                              SizedBox(width: 10,),
                              Card(
                                shadowColor: Colors.black,
                                elevation: 15,
                                child: Container(
                                  height: 100,
                                  width: 305,
                                  child:Row(
                                    children: [
                                      SizedBox(width: 10,),
                                      Container(
                                        width: 150,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(height: 10,),
                                            Text("Postal Addr.",style: TextStyle(fontSize: 25,),),
                                            SizedBox(height: 5,),
                                            Text("Of Owner :-",style: TextStyle(fontSize: 25,),),
                                          ],
                                        )  
                                      ),
                                      Container(
                                        width: 130,
                                        child:Text("$owneraddress",style: TextStyle(fontSize: 23,),)
                                      )
                                    ],
                                  )
                                )
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      )
    );
  }
  
}