import 'package:flutter/material.dart';

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

        primarySwatch: Colors.teal ,
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
        backgroundColor: Colors.white ,
        drawer: Drawer(
          child: Container(
            color: Colors.amberAccent,
            child: ListView(
              children: [
                DrawerHeader(
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 50,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Column(
                          children: [
                            Text("You're Welcome Here"),
                            SizedBox(
                              height: 7,
                            ),
                            Container(
                              height: 25,
                              child: OutlinedButton(
                                onPressed: (){},
                                child: Text('Sign in'),

                              ),
                            )
                          ],
                        )
                      ],
                    )
                )
              ],
            ),
          ),
        ),
        appBar: AppBar(
          iconTheme: IconThemeData( color: Colors.black) ,
          backgroundColor: Color(0xffd6b738),
          title: Text('Home',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 17
              )),

        ),
        body:Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Column(
            children: [
              Container(
                height: 150,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage('https://www.k9web.com/wp-content/uploads/2020/09/golden-retriever-cost-780x520.jpg'),
                  ),
                  color: Colors.white ,
                  borderRadius: BorderRadius.circular(20),
                ),

              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:[
                    Text('Go ahead, Animal lovers!'),

                  ],
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:[
                  Container(
                    height: 250,
                    width: 170,
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
                                    Text('  Report', style: TextStyle(
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
                  Container(
                    height: 250,
                    width: 170,
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
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Container(
                      height: 250,
                      width: 170,
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
                    height: 250,
                    width: 170,
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
              )

            ],
          ),
        )
    );
  }
}
