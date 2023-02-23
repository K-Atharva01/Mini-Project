import 'package:flutter/material.dart';
import 'package:flutter/src/material/colors.dart';

class MyCartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // centerTitle: true,
          title: const Text(
            'MY SHOPPING CART',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 27),
          ),
          toolbarHeight: 75.0,
        ),
        body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 30.0, left: 10.0),
                    child: Text('PET FOOD ACCESSORIES !',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 27.0,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Container(
                      height: 200,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            conta(),
                            contb(),
                            contc(),
                            contd(),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 30.0, left: 10.0),
                    child: Text('PET MEDICAL ACCESSORIES !',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 27.0,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Container(
                      height: 200,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            conte(),
                            contf(),
                            contg(),
                            conth(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )));
  }
}

Widget conta() => Column(
      children: [
        FittedBox(
          child: Container(
            height: 100,
            width: 200,
            child: Image.asset('assets/store_assets/chunks.jpg'),
          ),
        )
      ],
    );

Widget contb() => Column(
      children: [
        Container(
          height: 100,
          width: 200,
          child: Image.asset('assets/store_assets/icecr.jpeg'),
        )
      ],
    );

Widget contc() => Column(
      children: [
        Container(
          height: 100,
          width: 200,
          child: Image.asset('assets/store_assets/raw.jpeg'),
        )
      ],
    );

Widget contd() => Column(
      children: [
        Container(
          height: 100,
          width: 200,
          child: Image.asset('assets/store_assets/nd.jpg'),
        )
      ],
    );

Widget conte() => Column(
      children: [
        Container(
          height: 100,
          width: 200,
          child: Image.asset('assets/store_assets/m1.jpg'),
        )
      ],
    );

Widget contf() => Column(
      children: [
        Container(
          height: 100,
          width: 200,
          child: Image.asset(
            'assets/store_assets/m2.jpeg',
            fit: BoxFit.cover,
          ),
        )
      ],
    );

Widget contg() => Column(
      children: [
        Container(
          height: 100,
          width: 200,
          child: Image.asset(
            'assets/store_assets/m4.jpeg',
            fit: BoxFit.cover,
          ),
        )
      ],
    );

Widget conth() => Column(
      children: [
        Container(
          height: 100,
          width: 200,
          child: Image.asset(
            'assets/store_assets/plus.jpeg',
            fit: BoxFit.contain,
          ),
        )
      ],
    );

class MyStorePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // centerTitle: true,
          title: const Text(
            'MY STORE',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 27),
          ),
          toolbarHeight: 75.0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 30.0),
                child: Text('WELCOME TO OUR STORE !',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 27.0,
                      fontWeight: FontWeight.normal,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 0.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: 250.0,
                      width: 155.0,
                      child: Image.asset('assets/store_assets/chick.jpg'),
                    ),
                    SizedBox(
                      height: 250.0,
                      width: 155.0,
                      child: Image.asset('assets/store_assets/med.jpg'),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 0.0),
                child: Text(
                    'We deliver food items and provide medicines for your pets',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25.0,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.normal,
                      color: Colors.indigo,
                    )),
              ),
              const Padding(
                padding: EdgeInsets.all(40.0),
                child: Text(
                  'Buy them at affordable rates! ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 35.0,
                    fontWeight: FontWeight.normal,
                    color: Colors.blueAccent,
                  ),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MyCartPage(),
                        ));
                  },
                  child: Text('GET STARTED'))
            ],
          ),
        ));
  }
}
