import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:semifin/adminhome.dart';
import 'package:semifin/adminprofile.dart';
import 'authcontroller.dart';
import 'login.dart';

class adminprofile extends StatefulWidget{
  @override
  State<adminprofile> createState() => _adminprofileState();
}

class _adminprofileState extends State<adminprofile> {
  AuthController authController = Get.find<AuthController>();


  @override
  void initState(){
    super.initState();
    authController.getAdminInfo();
  }

  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData( color: Colors.black) ,
          backgroundColor: Colors.white,
          title: Text('Profile',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,

              )),
          centerTitle: true,

        ),
        body: Stack(
          children: [
            buildprofile(context),

          ],
        )
    );
  }
}

Widget buildprofile (BuildContext context){
  AuthController authController = Get.find<AuthController>();

  return Positioned(

    top: 0,
    left: 0,
    right: 0,
    bottom: 0,
    child:Obx(()=>authController.myadmin.value.amainname == null? Center(child: CircularProgressIndicator(),): Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets1/homepage.jpg')
          )
      ),
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 35),
            child: Container(
              child: Column(
                children: [
                  Text('info',
                    style:
                    TextStyle(
                        fontFamily: 'font1',
                        fontSize: 65,
                        fontWeight: FontWeight.w500,
                        color: Colors.brown
                    ),
                  ),
                ],
              ),
            ),
          ),

          SizedBox(
            height: 45,
          ),
          Container(
            width: 160,
            height: 160,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      spreadRadius: 3, blurRadius: 17,
                      color: Colors.black.withOpacity(0.3),
                      offset: Offset(0,10)
                  )
                ],
                shape: BoxShape.circle,
                image: authController.myadmin.value.aimage == null? DecorationImage(
                    fit: BoxFit.fitHeight,
                    image: AssetImage('assets1/profile4.jpg')
                ): DecorationImage(
                    fit: BoxFit.fitHeight,
                    image: NetworkImage(authController.myadmin.value.aimage!)
                )
            ),
          ),
          SizedBox(
            height: 35,
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 10),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText( text: TextSpan(
                      children: [
                        TextSpan(
                          text: authController.myadmin.value.amainname,
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        )
                      ]
                  ),

                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 80, right: 50),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText( text: TextSpan(
                      children: [
                        TextSpan(
                          text: authController.myadmin.value.aname1,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w300,
                            color: Colors.black,
                          ),

                        ),
                      ]
                  ),

                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 35,
          ),
          Container(
            child: Column(
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    textStyle: TextStyle(fontSize: 23),
                    primary: Colors.brown,

                    minimumSize: Size(70, 50),
                  ),
                  child: Text('Edit Profile',
                    style:
                    TextStyle(
                        fontWeight: FontWeight.bold ,
                        color: Colors.white),),

                  onPressed: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>admininfo())
                    );
                  },
                ),
              ],
            ),
          ),
          SizedBox(
            height: 45,
          ),

          Container(
            child: Column(
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    textStyle: TextStyle(fontSize: 23),
                    primary: Colors.brown,

                    minimumSize: Size(70, 50),
                  ),
                  child: Text('Go to HomePage',
                    style:
                    TextStyle(
                        fontWeight: FontWeight.bold ,
                        color: Colors.white),),

                  onPressed: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>adminhome())
                    );
                  },
                ),
              ],
            ),
          ),
          SizedBox(
            height: 45,
          ),

          Container(
            child: Column(
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    textStyle: TextStyle(fontSize: 23),
                    primary: Colors.brown,

                    minimumSize: Size(70, 50),
                  ),
                  child: Text('Sign Out',
                    style:
                    TextStyle(
                        fontWeight: FontWeight.bold ,
                        color: Colors.white),),

                  onPressed: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>login())
                    );
                  },
                ),
              ],
            ),
          )

        ],
      ),
    )),
  );
}
