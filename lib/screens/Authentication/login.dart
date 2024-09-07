import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:yumm/screens/Authentication/forgotPasswordPage.dart';
import 'package:yumm/screens/Authentication/register.dart';
import 'package:yumm/screens/Authentication/registeration.dart';
import 'package:yumm/screens/landing.dart';
import 'package:yumm/widget/custom-widget.dart';
// import 'package:yumm/screens/userdashbord.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String email = "", password = "";
  final _formkey = GlobalKey<FormState>();

  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();

  userLogin() async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Landing()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.orangeAccent,
            content: Text(
              "No User Found for that Email",
              style: TextStyle(fontSize: 18.0),
            )));
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
          "Wrong Password Provided by User",
          style: TextStyle(fontSize: 18.0, color: Colors.black),
        )));
      } else {
        // Handle other exceptions (e.g., network errors)
        // Don't print the error code, use a generic message
        showDialog(
          context: context, // Replace with your context provider
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Sign In Error'),
              content: const Text(
                  'Invalid Email or Password. Please enter correct credentials.'),
              actions: [
                TextButton(
                  child: const Text('OK'),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            );
          },
        );
      }
    }
  }

  bool _secureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          //backgroundColor: Colors.deepOrange,
          title: Text("Login"),
        ),
        body: Container(
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.center,
            child: SingleChildScrollView(
                child: Center(
              //heightFactor: 1.5,

              child: Form(
                key: _formkey,
                child:
                    Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                  // SizedBox(height: 20), // This is for gaping
                  Lottie.network(
                      "https://lottie.host/f222a9c9-7163-4ded-9b61-4a31aefe475f/kinPhSHLSN.json",
                      height: 130,
                      fit: BoxFit.fill),
                  // Image.asset("assets/images/user.png",
                  //  height: 110, fit: BoxFit.fill),
                  //Image(image: AssetImage('assets/login3.png')),
                  SizedBox(height: 40),

                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: "Login as ",
                        style: TextStyle(color: Colors.black, fontSize: 23)),
                    TextSpan(
                      text: "User",
                      style: Mywidget.skipText(),
                    )
                  ])),

                  SizedBox(height: 60), // This is for gaping

                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
                    child: TextFormField(
                      controller: _emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter Email';
                        }
                        return null;
                      },
                      //   controller: userIdController,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                color: Colors.deepOrangeAccent,
                                width: 2,
                              )),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          labelText: "User ID",
                          hintText: "Please Enter User Id ..",
                          hintStyle: TextStyle(fontWeight: FontWeight.w300),
                          labelStyle: TextStyle(
                              color: Colors.deepOrange,
                              fontWeight: FontWeight.bold),
                          filled: true,
                          fillColor: Colors.white),
                    ),
                  ),

                  SizedBox(height: 10), // This is for gaping

                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
                    child: TextFormField(
                      controller: _passwordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter Password';
                        }
                        return null;
                      },
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      obscureText: _secureText,
                      decoration: InputDecoration(
                          suffixIconColor: Colors.deepOrange,
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                color: Colors.deepOrangeAccent,
                                width: 2,
                              )),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                color: Colors.deepOrangeAccent,
                              )),
                          labelText: "password",
                          hintText: "Please Enter Password ..",
                          hintStyle: TextStyle(fontWeight: FontWeight.w300),
                          labelStyle: TextStyle(
                              color: Colors.deepOrange,
                              fontWeight: FontWeight.bold),
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _secureText = !_secureText;
                                });
                              },
                              icon: Icon(_secureText
                                  ? Icons.remove_red_eye
                                  : Icons.security_outlined)),
                          filled: true,
                          fillColor: Colors.white),
                    ),
                  ),
SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return Forgotpasswordpage();
                        }),
                      );
                    },
                    child: Container(
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.only(right: 34),
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                          color: Colors.deepOrange,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30), // This is for gaping

                  Padding(
                      padding: EdgeInsets.all(10),
                      child: ElevatedButton(
                        child: Text(
                          "Login",
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepOrange,
                          fixedSize: Size(300, 50),
                          textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onPressed: () {
                          if (_formkey.currentState!.validate()) {
                            setState(() {
                              email = _emailController.text;
                              password = _passwordController.text;
                            });
                          }
                          userLogin();
                        },
                      )),
                  SizedBox(height: 10),

                  //signup

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Not a member ?'),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Register()));
                        },
                        child: Text(
                          ' Register now',
                          style: TextStyle(
                            color: Colors.deepOrange,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  
                     SizedBox(height: 40),
              
                ]),
              ),
            ))));
  }
}
