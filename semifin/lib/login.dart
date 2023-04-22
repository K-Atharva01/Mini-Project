import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:semifin/adminreg.dart';
import 'package:semifin/login_form.dart';
import 'package:semifin/profile.dart';

class login extends StatefulWidget {
  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  _googleSignUp() async {
    try {
      final GoogleSignIn _googleSignIn = GoogleSignIn(
        scopes: ['email'],
      );
      final FirebaseAuth _auth = FirebaseAuth.instance;

      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      print(GoogleSignInAccount);
      print("Testing");
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      final User? user = (await _auth.signInWithCredential(credential)).user;
      // print("signed in " + user.displayName);

      return user;
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        height: 900,
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover, image: AssetImage('assets/signup3.jpg'))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 130),
              height: 400,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    'Sign in',
                    style: TextStyle(
                      fontFamily: 'font1',
                      fontWeight: FontWeight.bold,
                      fontSize: 80,
                      color: Colors.pinkAccent,
                    ),
                  ),
                  Column(
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          textStyle: TextStyle(fontSize: 23),
                          primary: Colors.amberAccent,
                          minimumSize: Size(280, 80),
                        ),
                        child: const Text(
                          'Login',
                          style: TextStyle(
                              fontFamily: 'font1',
                              fontWeight: FontWeight.bold,
                              color: Colors.black87),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => LoginForm()));
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          textStyle: TextStyle(fontSize: 23),
                          primary: Colors.amberAccent,
                          minimumSize: Size(280, 80),
                        ),
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                              fontFamily: 'font1',
                              fontWeight: FontWeight.bold,
                              color: Colors.black87),
                        ),
                        onPressed: () {
                          // _googleSignUp().then(
                          //   (value) => Navigator.of(context).pushReplacement(
                          //     MaterialPageRoute(
                          //       builder: (context) => profile(),
                          //     ),
                          //   ),
                          // );
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => profile()));
                        },
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          textStyle: TextStyle(fontSize: 15),
                          primary: Colors.amberAccent,
                          minimumSize: Size(100, 40),
                        ),
                        child: Text(
                          'Login as admin',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black87),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyRegister()));
                        },
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
