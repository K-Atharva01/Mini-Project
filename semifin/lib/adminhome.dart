import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:semifin/admininfo.dart';
import 'package:semifin/adminprofile.dart';

class adminhome extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData( color: Colors.black) ,
    backgroundColor: Colors.brown,
    title: Text('Home',
    style: TextStyle(
    color: Colors.white,
    fontSize: 20,

    )),
    centerTitle: true,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets1/profile4.jpg')
            )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => admininfo())
                );
              },
              child: Container(
                height: 150,
                width: 350,

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                    color: Colors.brown,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Text('Profile',style:
                  TextStyle(
                    fontFamily: 'font1',
                    fontWeight: FontWeight.w200 ,
                    fontSize: 80,
                    color: Colors.white,
                  ),),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}