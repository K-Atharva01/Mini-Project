import 'package:flutter/material.dart';
import 'report.dart';
import 'mainprofile.dart';

class homepage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white ,

        appBar: AppBar(
          iconTheme: IconThemeData( color: Colors.black) ,
          backgroundColor: Colors.brown,
          title: Text('Home',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,

              )),
          centerTitle: true,

        ),
        body:Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                    image: AssetImage('assets/homepage.jpg')
                )
            ),
            child: Column(
              children: [
                Container(
                  height: 150,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/home1.jpg')
                    ),
                    color: Colors.white ,
                    borderRadius: BorderRadius.circular(20),
                  ),

                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:[
                      Text('Go ahead, Animal lovers!', style: TextStyle(fontWeight: FontWeight.bold ,
                          color: Colors.black87),),

                    ],
                  ),
                ),

                SingleChildScrollView(
                  child: Row(

                    children:[
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                        child: Container(
                          height: 200,
                          width: 130,
                          decoration: BoxDecoration(
                            color: Colors.white ,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            children: [
                              Expanded(
                                flex: 3,
                                child: Image.network('https://thumbs.dreamstime.com/b/white-exclamation-mark-triangle-icon-isolated-long-shadow-hazard-warning-sign-careful-attention-danger-pink-hexagon-button-189015310.jpg'),
                              ),
                              Expanded(

                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 30,
                                        decoration: BoxDecoration(
                                          color: Colors.white ,
                                          borderRadius: BorderRadius.circular(100),
                                        ),
                                        child: OutlinedButton(
                                          child:
                                          Text('Report', style: TextStyle(
                                            color:Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                          ),
                                          ),
                                          onPressed: (){
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(builder: (context) => ImagePickerApp())
                                            );
                                          },
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 200,
                        width: 130,
                        decoration: BoxDecoration(
                          color: Colors.white ,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            Expanded(
                              flex: 3,
                              child: Image.network('https://assets-global.website-files.com/5fce4d055c2d34363bd1d1b4/620196078c189523e74998de_New%20Logo.jpg'),
                            ),
                            Expanded(

                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 30,
                                      decoration: BoxDecoration(
                                        color: Colors.white ,
                                        borderRadius: BorderRadius.circular(100),
                                      ),
                                      child: OutlinedButton(
                                        child:
                                        Text('  Adopt', style: TextStyle(
                                          color:Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                        ),
                                        onPressed: (){
                                          print('Text button tapped');
                                        },
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 50),
                      child: Container(
                        height: 200,
                        width: 130,
                        decoration: BoxDecoration(
                          color: Colors.white ,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            Expanded(
                              flex: 3,
                              child: Image.network('https://en.pimg.jp/062/124/406/1/62124406.jpg'),
                            ),
                            Expanded(

                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 30,
                                      decoration: BoxDecoration(
                                        color: Colors.white ,
                                        borderRadius: BorderRadius.circular(100),
                                      ),
                                      child: OutlinedButton(
                                        child:
                                        Text('   Store', style: TextStyle(
                                          color:Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                        ),
                                        onPressed: (){
                                          print('Text button tapped');
                                        },
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 200,
                      width: 130,
                      decoration: BoxDecoration(
                        color: Colors.white ,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Image.network('https://thumbs.dreamstime.com/b/default-avatar-profile-icon-trendy-flat-style-isolated-white-background-187477840.jpg'),
                          ),
                          Expanded(

                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 30,
                                    decoration: BoxDecoration(
                                      color: Colors.white ,
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    child: OutlinedButton(
                                      child:
                                      Text(' Profile', style: TextStyle(
                                        color:Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                      ),
                                      onPressed: (){
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) => mainprofile())
                                        );
                                      },
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    )

                  ],
                )

              ],
            ),
          ),
        )

    );
  }
}
