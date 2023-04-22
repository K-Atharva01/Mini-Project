import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_adoption_miniproject/AodptionIncreasedInfo.dart';
class AdoptList extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Adoption List"),
      ),
      body: Container(
        child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection("Users").snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            //DocumentReference doc;
           // var UName=snapshot.data!.docs;
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder:(context,index)=>Container(
                  child: InkWell(
                    child: Card(
                      shadowColor: Colors.blueGrey,
                      elevation: 8,
                      child: Row(
                        children: [
                          Container(
                            width: 150,
                            height: 150,
                            child: Image.network(snapshot.data!.docs[index]["Image"]),  
                          ),
                          SizedBox(width: 10,),
                          Container(
                            width: 185,
                            height: 170,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 10,),
                                Text("Type Of Pet :- ${snapshot.data!.docs[index]["Type Of Pet"]}",style: TextStyle(fontSize: 20,color: Colors.pink),),
                                SizedBox(height: 10,),
                                Text("Name Of Pet :- ${snapshot.data!.docs[index]["Name Of Pet"]}",style: TextStyle(fontSize: 20,color: Colors.brown),),
                                SizedBox(height: 10,),
                                Text("Gender Of Pet :- ${snapshot.data!.docs[index]["Gender Of Pet"]}",style: TextStyle(fontSize: 20,color: Colors.green),),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>AdoptionInfo(snapshot.data!.docs[index]["Type Of Pet"], snapshot.data!.docs[index]["Name Of Pet"], snapshot.data!.docs[index]["Age Of Pet"], snapshot.data!.docs[index]["Gender Of Pet"], snapshot.data!.docs[index]["Colour Of Pet"], snapshot.data!.docs[index]["Image"], snapshot.data!.docs[index]["Name Of Owner"], snapshot.data!.docs[index]["Phone Number Of Owner"], snapshot.data!.docs[index]["Postal Address Of Owner"],snapshot.data!.docs[index].reference.id)));
                    },
                  ),
                )
              );
            } else{  
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
  
}