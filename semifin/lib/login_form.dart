import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:semifin/homepage.dart';
import 'package:semifin/login.dart';
import 'package:semifin/profile.dart';
import 'package:semifin/utils/snackbar.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formkey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  bool isLoading = false;
  bool _isPassValid = true;
  bool _isMailValid = true;
  String _userEmail = '';
  String _userPassword = '';
  final defaultBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: const BorderSide(color: Colors.black, width: 1.0));

  void _trySubmit() async {
    setState(() {
      isLoading = true;
    });
    final isValid = _formkey.currentState?.validate();
    FocusScope.of(context).unfocus();
    if (isValid != null) {
      if (isValid) {
        _formkey.currentState?.save();
        try {
          print("object");
          await _auth.signInWithEmailAndPassword(
              email: _userEmail, password: _userPassword);
          setState(() {
            isLoading = false;
          });
          Navigator.of(context)
              .push(MaterialPageRoute(builder: ((context) => homepage())));
        } catch (e) {
          showSnackBar(context, e.toString(), true);
        }
      } else {
        setState(() {
          isLoading = false;
        });
        showSnackBar(context, "Enter valid field values", true);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
            key: _formkey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Semantics(
                    excludeSemantics: true,
                    label: "Email address input box. Double tap to activate",
                    hint: _isMailValid ? null : "Email is  invalid",
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || !value.contains('@')) {
                          _isMailValid = false;
                          return "Please enter valid email address";
                        }
                        _isMailValid = true;
                        return null;
                      },
                      keyboardType: TextInputType.emailAddress,
                      style: const TextStyle(
                          fontFamily: 'Lora',
                          fontSize: 16,
                          color: Color(0xFF454545)),
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 10),
                        isDense: true,
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "Email address",
                        border: defaultBorder,
                        enabledBorder: defaultBorder,
                        focusedBorder: defaultBorder,
                        errorStyle:
                            const TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      onSaved: (newValue) {
                        _userEmail = newValue!;
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Semantics(
                    excludeSemantics: true,
                    label: "Password input box. Double tap to activate",
                    hint: _isPassValid ? null : "Password is  invalid",
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.length < 7) {
                          _isPassValid = false;
                          return "Invalid Password";
                        }
                        _isPassValid = true;
                        return null;
                      },
                      style: const TextStyle(
                          fontFamily: 'Lora',
                          fontSize: 16,
                          color: Color(0xFF454545)),
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 10),
                        isDense: true,
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "Password",
                        border: defaultBorder,
                        enabledBorder: defaultBorder,
                        focusedBorder: defaultBorder,
                        errorStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      obscureText: true,
                      onSaved: (newValue) {
                        _userPassword = newValue!;
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                if (isLoading)
                  const CircularProgressIndicator(
                    semanticsLabel: "Loading",
                    color: Colors.black,
                  ),
                if (!isLoading)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: ElevatedButton(
                        onPressed: _trySubmit,
                        style: ElevatedButton.styleFrom(
                            fixedSize: const Size(396, 40),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            elevation: 0,
                            backgroundColor:
                                Theme.of(context).colorScheme.secondary),
                        child: const Text("Login",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                letterSpacing: 2))),
                  ),
                Row(
                  children: [
                    Expanded(
                        child: Container(
                            margin: const EdgeInsets.only(left: 16, right: 6),
                            child: const Divider(
                              color: Color(0xFFD9D9D9),
                              height: 72,
                              thickness: 1.5,
                            ))),
                    Semantics(
                      excludeSemantics: true,
                      hint: "Sign up if you are a new user",
                      label: "Information text",
                      child: const Text(
                        "New here ?",
                        style: TextStyle(
                            fontFamily: 'Lora',
                            fontSize: 16,
                            color: Color.fromARGB(255, 0, 0, 0)),
                      ),
                    ),
                    Expanded(
                        child: Container(
                            margin: const EdgeInsets.only(left: 6, right: 16),
                            child: const Divider(
                              color: Color(0xFFD9D9D9),
                              height: 72,
                              thickness: 1.5,
                            ))),
                  ],
                ),
                Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    width: double.infinity,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                    ),
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (_) => profile()));
                      },
                      child: const Text(
                        "Sign up",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            letterSpacing: 2),
                      ),
                    ))
              ],
            )),
      ),
    );
  }
}
