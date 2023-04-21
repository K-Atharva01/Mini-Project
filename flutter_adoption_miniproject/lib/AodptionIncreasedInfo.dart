import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
late String phone;
class AdoptionInfo extends StatelessWidget{
  var pettype;
  var petname;
  var petage;
  var petgender;
  var petcolour;
  var image;
  var ownername;
  var ownerphone;
  var owneraddress;

  AdoptionInfo(
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
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Pet Info"),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child:SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 10,),
              Container(
                width: 200,
                height: 200,
                child: Image.network(image),
              ),
              SizedBox(height: 15,),
              Container(
                width: 340,
                height: 90,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  border: Border.all(
                    width: 1,
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 5,),
                    Row(
                      children: [
                        SizedBox(width: 10,),
                        Text("$petname",style: TextStyle(fontSize: 25,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold,decoration: TextDecoration.underline,decorationStyle: TextDecorationStyle.solid,decorationThickness: 2),),
                        SizedBox(width: 15,),
                        Icon(Icons.pets,)
                      ],
                    ),
                    SizedBox(height: 5,),
                    Row(
                      children: [
                        SizedBox(width: 10,),
                        Icon(Icons.location_on,),
                        SizedBox(width: 15,),
                        Text("$owneraddress",style: TextStyle(fontSize: 25,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold,decoration: TextDecoration.underline,decorationStyle:TextDecorationStyle.solid,decorationThickness: 2 ),),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 10,),
                    Card(
                      elevation: 10,
                      shadowColor: Colors.black87,
                      color: Colors.white70,
                      child: Container(
                        width: 130,
                        height: 130,
                        child: Column(
                          children: [
                            SizedBox(height: 15,),
                            Text("Type",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic,color: Colors.red,),),
                            SizedBox(height: 15,),
                            Text("$pettype",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      elevation: 10,
                      shadowColor: Colors.black87,
                      color: Colors.white70,
                      child: Container(
                        width: 130,
                        height: 130,
                        child: Column(
                          children: [
                            SizedBox(height: 15,),
                            Text("Age",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic,color: Colors.red,),),
                            SizedBox(height: 15,),
                            Text("$petage Mths.",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      elevation: 10,
                      shadowColor: Colors.black87,
                      color: Colors.white70,
                      child: Container(
                       width: 130,
                        height: 130,
                        child: Column(
                          children: [
                            SizedBox(height: 15,),
                            Text("Gender",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic,color: Colors.red,),),
                            SizedBox(height: 15,),
                            Text("$petgender",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      elevation: 10,
                      shadowColor: Colors.black87,
                      color: Colors.white70,
                      child: Container(
                        width: 130,
                        height: 130,
                        child: Column(
                          children: [
                            SizedBox(height: 15,),
                            Text("Colour",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic,color: Colors.red,),),
                            SizedBox(height: 15,),
                            Text("$petcolour",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),),
                          ],
                        ),
                      ),
                    ),
                  SizedBox(width: 10,),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Card(
                elevation: 10,
                shadowColor: Colors.black,
                child: Container(
                  width: 340,
                  height: 70,
                  child: Column(
                    children: [
                      SizedBox(height: 5,),
                      Row(
                        children: [
                          Container(
                            width: 150,
                            child: Row(
                              children: [
                                SizedBox(width: 10,),
                                Icon(Icons.person,color: Colors.black,),
                                SizedBox(width: 10,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("$ownername",style: TextStyle(fontSize: 18,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold,color: Colors.black),),
                                    SizedBox(height: 5,),
                                    Text("Pet's Owner",style: TextStyle(fontSize: 18,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold,color: Colors.black),),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 180,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                               ElevatedButton(
                                onPressed: ()async{
                                  final Uri url=Uri(
                                    scheme: "tel",
                                    path: "$ownerphone",
                                  );
                                  if(await canLaunchUrl(url)){
                                    await launchUrl(url);
                                  }
                                },
                                child: Container(
                                  child: Row(
                                    children: [
                                      SizedBox(width: 5,),
                                      Icon(Icons.call),
                                      SizedBox(width: 5,),
                                      Text("Call"),
                                      SizedBox(width: 5,)
                                    ],
                                  ),
                                )
                              )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Row(
                children: [
                  SizedBox(width: 20,),
                  Text("Click 'Adopt' Button After Contacting the Owner !",style: TextStyle(fontSize: 10),),
                  SizedBox(width: 10,),
                  AdoptButton()
                ],
              )
              
            ],
          ),
        ),
      ),
    );
  }

}

AdoptButton(){
  return Container(
    width: 100,
    child: ElevatedButton(
      onPressed: (){},
      child: Row(
        children: [ 
          Text("Adopt Me",style: TextStyle(fontSize: 15),),
        ],
      ),
    ),
  );
}