import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:lottie/lottie.dart';
import 'package:random_string/random_string.dart';
import 'package:yumm/screens/Authentication/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:yumm/screens/location.dart';
import 'package:yumm/service/shared_pref.dart';
import 'package:yumm/widget/custom-widget.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool _secureText = true;
  bool _securetext = true;
  String email = "",
      password = "",
      confirmpassword = " ",
      name = "",
      mobile = " ";

  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  TextEditingController _confirmpasswordController = new TextEditingController();
  TextEditingController _nameController = new TextEditingController();
  TextEditingController _mobileController = new TextEditingController();

  final _formkey = GlobalKey<FormState>();

  registration() async {
    if (password != null 
    // &&
    //     email != null &&
    //     confirmpassword != null &&
    //     name != null &&
    //     mobile != null
        ) {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);

        ScaffoldMessenger.of(context).showSnackBar((SnackBar(
            backgroundColor: Colors.redAccent,
            content: Text(
              "Registered Successfully",
              style: TextStyle(fontSize: 20.0),
            ))));

        String Id = randomAlphaNumeric(10);

        Map<String, dynamic> addUserInfo = {
          "Name": _nameController.text,
          "Email": _emailController.text,
          "Mobile": _mobileController.text,
          "Id": Id,
        };
        await addUserDetail(addUserInfo, Id);
        await SharedPreferenceHelper().saveUserName(_nameController.text);
        await SharedPreferenceHelper().saveUserEmail(_emailController.text);
        await SharedPreferenceHelper().saveUserPhone(_mobileController.text);

        await SharedPreferenceHelper().saveUserId(Id);

        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const Location()));
      } on FirebaseException catch (e) {
        if (e.code == 'weak-password') {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.orangeAccent,
              content: Text(
                "Password Provided is too Weak",
                style: TextStyle(fontSize: 18.0),
              )));
        } else if (e.code == "email-already-in-use") {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.orangeAccent,
              content: Text(
                "Account Already exsists",
                style: TextStyle(fontSize: 18.0),
              )));
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            // backgroundColor: Colors.black,

            ),
        // backgroundColor:  Color.fromARGB(255, 247, 162, 4),

        body: Container(
            alignment: Alignment.center,
            child: SingleChildScrollView(
                child: Form(
              key: _formkey,
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                // SizedBox(height: 20), // This is for gaping
                Lottie.network(
                    "https://lottie.host/f222a9c9-7163-4ded-9b61-4a31aefe475f/kinPhSHLSN.json",
                    height: 110,
                    fit: BoxFit.fill),
                // Image.asset("assets/images/user.png",
                //  height: 110, fit: BoxFit.fill),
                //Image(image: AssetImage('assets/login3.png')),
                SizedBox(height: 20),
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: "Register as ",
                      style: TextStyle(color: Colors.black, fontSize: 23)),
                  TextSpan(text: "User", style: Mywidget.skipText())
                ])),

                SizedBox(height: 10), // This is for gaping

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
                  child: TextFormField(
                    controller: _nameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter Name';
                      }
                      return null;
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
                        labelText: "Name",
                        hintText: "Please Enter Name ..",
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
                  padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
                  child: TextFormField(
                    controller: _emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter E-mail';
                      }
                      return null;
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
                        labelText: "Mail ID",
                        hintText: "Please Enter Mail Id ..",
                        hintStyle: TextStyle(fontWeight: FontWeight.w300),
                        labelStyle: TextStyle(
                            color: Colors.deepOrange,
                            fontWeight: FontWeight.bold),
                        filled: true,
                        fillColor: Colors.white),
                  ),
                ),

                SizedBox(height: 10),

                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 25.0, vertical: 10),
                  child: IntlPhoneField(
                    controller: _mobileController,
                    decoration: InputDecoration(
                      labelText: 'Phone Number',
                      labelStyle: TextStyle(
                          color: Colors.deepOrange,
                          fontWeight: FontWeight.bold),
                      hintText: "Please Enter Phone number ..",
                      hintStyle: TextStyle(fontWeight: FontWeight.w300),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            color: Colors.deepOrangeAccent,
                            width: 2,
                          )),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(),
                      ),
                    ),
                    initialCountryCode: 'IN',
                    onChanged: (phone) {
                      print(phone.completeNumber);
                    },
                  ),
                ),
                SizedBox(height: 10),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
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

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
                  child: TextFormField(
                    controller: _confirmpasswordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please re- Enter Password';
                      }
                      return null;
                    },
                    //  controller: passwordController,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    obscureText: _securetext,

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
                        labelText: "Confirm password",
                        hintText: "Please Re-enter Password ..",
                        hintStyle: TextStyle(fontWeight: FontWeight.w300),
                        labelStyle: TextStyle(
                            color: Colors.deepOrange,
                            fontWeight: FontWeight.bold),
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _securetext = !_securetext;
                              });
                            },
                            icon: Icon(_securetext
                                ? Icons.remove_red_eye
                                : Icons.security_outlined)),
                        filled: true,
                        fillColor: Colors.white),
                  ),
                ),
                SizedBox(height: 30), // This is for gaping

                Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
                    child: ElevatedButton(
                      child: Text(
                        "Sign up",
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
                            name = _nameController.text;
                            password = _passwordController.text;
                            //mobile=_mobileController;
                            confirmpassword = _confirmpasswordController.text;
                          });
                        }
                        registration();
                      },
                    )),
                SizedBox(height: 10),

                //signup

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already a member ?'),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return Login();
                          }),
                        );
                      },
                      child: Text(
                        ' Login now',
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
            ))));
  }

  addUserDetail(Map<String, dynamic> addUserInfo, String Id) async {
    return await FirebaseFirestore.instance
        .collection('user')
        .doc(Id)
        .set(addUserInfo);
  }
}
