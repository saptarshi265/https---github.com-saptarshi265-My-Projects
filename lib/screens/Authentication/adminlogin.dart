import 'package:flutter/material.dart';
import 'package:yumm/screens/admindash.dart';
import 'package:lottie/lottie.dart';
import 'package:yumm/widget/custom-widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Adminlogin extends StatefulWidget {
  const Adminlogin({super.key});

  @override
  State<Adminlogin> createState() => _AdminloginState();
}

class _AdminloginState extends State<Adminlogin> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  TextEditingController userIdController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  bool _secureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text("AdminLogin"),
        backgroundColor: Colors.transparent,
      ),
      body: Container(
          height: double.infinity,
          width: double.infinity,
          alignment: Alignment.center,
          // decoration: BoxDecoration(image:DecorationImage(image: AssetImage("assets/images/food.png")
          //,fit: BoxFit.fill  ),
          //  ),
          //width: sWidth,
          //height: sHeight,
          //color: Colors.deepOrange,
          // decoration: BoxDecoration(gradient: LinearGradient( colors: [

          //     Color.fromARGB(255, 130, 3, 3),
          //      Colors.deepOrange,
          //   ],
          //   begin: Alignment.bottomCenter,
          //   end: Alignment.topCenter,
          //   )),
          child: SingleChildScrollView(
              child: Form(
            key: _formkey,
            child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
              // SizedBox(height: 20), // This is for gaping
              Lottie.network(
                  "https://lottie.host/58100636-226e-4348-a7c1-657f73ee1f28/nybTH2ctty.json",
                  height: 110,
                  fit: BoxFit.fill),
              // Image.asset("assets/images/setting.png",
              //  height: 110, fit: BoxFit.fill),
              //Image(image: AssetImage('assets/login3.png')),
              SizedBox(height: 40),

              // Text(
              //   "Login as Admin",
              //   textAlign: TextAlign.center,
              //   style: TextStyle(
              //     fontSize: 26,
              //     color: Colors.deepOrange,
              //     fontWeight: FontWeight.bold,
              //   ),
              // ),
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: "Login as ",
                    style: TextStyle(color: Colors.black, fontSize: 23)),
                TextSpan(text: "Admin", style: Mywidget.skipText())
              ])),

              SizedBox(height: 60), // This is for gaping

              //   Text(
              //   "ADMIN ID :",
              // //  textAlign: TextAlign.left,
              //   style: TextStyle(
              //     fontSize: 15,
              //     color: Colors.deepOrange,
              //     fontWeight: FontWeight.w500,
              //   ),
              // ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
                child: TextFormField(
                  controller: userIdController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Username';
                    }
                  },
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
                      labelText: "Admin ID",
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
              //  Text(
              //   "PASSWORD :",
              //   textAlign: TextAlign.start,
              //   style: TextStyle(
              //     fontSize: 15,
              //     color: Colors.deepOrange,
              //     fontWeight: FontWeight.w500,
              //   ),
              // ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
                child: TextFormField(
                  controller: passwordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Password';
                    }
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
                      ),
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
                    LoginAdmin();
                        
                    },
                  ))
            ]),
          ))),
    );
  }
  LoginAdmin() {
    FirebaseFirestore.instance.collection("Admin").get().then((snapshot) {
      snapshot.docs.forEach((result) {
        if (result.data()['id'] != userIdController.text.trim()) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.orangeAccent,
              content: Text(
                "Your id is not correct",
                style: TextStyle(fontSize: 18.0),
              )));
        } else if (result.data()['password'] !=
            passwordController.text.trim()) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.orangeAccent,
              content: Text(
                "Your password is not correct",
                style: TextStyle(fontSize: 18.0),
              )));
        } else {
          Route route = MaterialPageRoute(builder: (context) => Admindash());
          Navigator.pushReplacement(context, route);
        }
      });
    });
  }
}
