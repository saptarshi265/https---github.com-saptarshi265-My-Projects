// import 'package:flutter/material.dart';
// import 'package:intl_phone_field/intl_phone_field.dart';
// import 'package:lottie/lottie.dart';
// import 'package:yumm/screens/Authentication/login.dart';
// import 'package:yumm/screens/landing.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:yumm/widget/custom-widget.dart';
// // import 'package:random_string/random_string.dart';

// class Register extends StatefulWidget {
//   const Register({super.key});

//   @override
//   State<Register> createState() => _RegisterState();
// }

// class _RegisterState extends State<Register> {
//   bool _secureText = true;
//   bool _securetext = true;

//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();
//   final _confirmpasswordController = TextEditingController();
//   final _nameController = TextEditingController();
//   final _mobileController = TextEditingController();

//   ShowMySnackBar(var sMsg) {
//     final SnBar = SnackBar(
//       content: Text(sMsg),
//       duration: Duration(seconds: 2),
//       backgroundColor: Colors.blueAccent,
//       showCloseIcon: true,
//       closeIconColor: Colors.white,
//       behavior: SnackBarBehavior.floating,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(12),
//       ),
//     );
//     ScaffoldMessenger.of(context).showSnackBar(SnBar);
//   }

//   @override
//   void dispose() {
//     _emailController.dispose();
//     _passwordController.dispose();
//     _confirmpasswordController.dispose();
//     _nameController.dispose();
//     _mobileController.dispose();

//     super.dispose();
//   }

//   Future<void> signUp() async {
//     // Check password confirmation before proceeding
//     if (_passwordController.text.trim() !=
//         _confirmpasswordController.text.trim()) {
//       showDialog(
//         context: context, // Replace with your context provider
//         builder: (BuildContext context) {
//           return AlertDialog(
//             title: const Text('Sign Up Error'),
//             content: const Text('Passwords do not match. Please try again.'),
//             actions: [
//               TextButton(
//                 child: const Text('OK'),
//                 onPressed: () => Navigator.of(context).pop(),
//               ),
//             ],
//           );
//         },
//       );
//       return; // Exit the function if passwords don't match
//     }
//     try {
//       await FirebaseAuth.instance.createUserWithEmailAndPassword(
//         email: _emailController.text.trim(),
//         password: _passwordController.text.trim(),
//       );
//       addUserDetails(
//         _nameController.text.trim(),
//         _mobileController.text.trim(),
//         _emailController.text.trim(),
//       );
//     } on FirebaseAuthException catch (e) {
//       // Handle signup errors
//       showDialog(
//         context: context, // Replace with your context provider
//         builder: (BuildContext context) {
//           return AlertDialog(
//             title: const Text('Sign Up Error'),
//             content: Text(e.message.toString()),
//             actions: [
//               TextButton(
//                 child: const Text('OK'),
//                 onPressed: () => Navigator.of(context).pop(),
//               ),
//             ],
//           );
//         },
//       );
//     }
//   }

//   Future addUserDetails(String name, String mobile, String email) async {
//     await FirebaseFirestore.instance.collection('users').add({
//       'name': name,
//       'mobile': mobile,
//       'email': email,
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//             // backgroundColor: Colors.black,

//             ),
//         // backgroundColor:  Color.fromARGB(255, 247, 162, 4),

//         body: Container(
//             alignment: Alignment.center,
//             child: SingleChildScrollView(
//                 child: Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                   // SizedBox(height: 20), // This is for gaping
//                   Lottie.network(
//                       "https://lottie.host/f222a9c9-7163-4ded-9b61-4a31aefe475f/kinPhSHLSN.json",
//                       height: 110,
//                       fit: BoxFit.fill),
//                   // Image.asset("assets/images/user.png",
//                   //  height: 110, fit: BoxFit.fill),
//                   //Image(image: AssetImage('assets/login3.png')),
//                   SizedBox(height: 20),
//                   RichText(
//                       text: TextSpan(children: [
//                     TextSpan(
//                         text: "Register as ",
//                         style: TextStyle(color: Colors.black, fontSize: 23)),
//                     TextSpan(text: "User", style: Mywidget.skipText())
//                   ])),

//                   SizedBox(height: 10), // This is for gaping

//                   Padding(
//                     padding:
//                         EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
//                     child: TextField(
//                       controller: _nameController,
//                       style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.bold,
//                       ),
//                       decoration: InputDecoration(
//                           focusedBorder: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(20),
//                               borderSide: BorderSide(
//                                 color: Colors.deepOrangeAccent,
//                                 width: 2,
//                               )),
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(20),
//                           ),
//                           labelText: "Name",
//                           hintText: "Please Enter Name ..",
//                           hintStyle: TextStyle(fontWeight: FontWeight.w300),
//                           labelStyle: TextStyle(
//                               color: Colors.deepOrange,
//                               fontWeight: FontWeight.bold),
//                           filled: true,
//                           fillColor: Colors.white),
//                     ),
//                   ),

//                   SizedBox(height: 10), // This is for gaping

//                   Padding(
//                     padding:
//                         EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
//                     child: TextField(
//                       controller: _emailController,
//                       style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.bold,
//                       ),
//                       decoration: InputDecoration(
//                           focusedBorder: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(20),
//                               borderSide: BorderSide(
//                                 color: Colors.deepOrangeAccent,
//                                 width: 2,
//                               )),
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(20),
//                           ),
//                           labelText: "Mail ID",
//                           hintText: "Please Enter Mail Id ..",
//                           hintStyle: TextStyle(fontWeight: FontWeight.w300),
//                           labelStyle: TextStyle(
//                               color: Colors.deepOrange,
//                               fontWeight: FontWeight.bold),
//                           filled: true,
//                           fillColor: Colors.white),
//                     ),
//                   ),

//                   SizedBox(height: 10),

//                   Padding(
//                     padding: const EdgeInsets.symmetric(
//                         horizontal: 25.0, vertical: 10),
//                     child: IntlPhoneField(
//                       controller: _mobileController,
//                       decoration: InputDecoration(
//                         labelText: 'Phone Number',
//                         labelStyle: TextStyle(
//                             color: Colors.deepOrange,
//                             fontWeight: FontWeight.bold),
//                         hintText: "Please Enter Phone number ..",
//                         hintStyle: TextStyle(fontWeight: FontWeight.w300),
//                         focusedBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(20),
//                             borderSide: BorderSide(
//                               color: Colors.deepOrangeAccent,
//                               width: 2,
//                             )),
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(20),
//                           borderSide: BorderSide(),
//                         ),
//                       ),
//                       initialCountryCode: 'IN',
//                       onChanged: (phone) {
//                         print(phone.completeNumber);
//                       },
//                     ),
//                   ),
//                   SizedBox(height: 10),

//                   Padding(
//                     padding:
//                         EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
//                     child: TextField(
//                       controller: _passwordController,
//                       style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.bold,
//                       ),
//                       obscureText: _secureText,
//                       decoration: InputDecoration(
//                           suffixIconColor: Colors.deepOrange,
//                           focusedBorder: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(20),
//                               borderSide: BorderSide(
//                                 color: Colors.deepOrangeAccent,
//                                 width: 2,
//                               )),
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(20),
//                           ),
//                           labelText: "password",
//                           hintText: "Please Enter Password ..",
//                           hintStyle: TextStyle(fontWeight: FontWeight.w300),
//                           labelStyle: TextStyle(
//                               color: Colors.deepOrange,
//                               fontWeight: FontWeight.bold),
//                           suffixIcon: IconButton(
//                               onPressed: () {
//                                 setState(() {
//                                   _secureText = !_secureText;
//                                 });
//                               },
//                               icon: Icon(_secureText
//                                   ? Icons.remove_red_eye
//                                   : Icons.security_outlined)),
//                           filled: true,
//                           fillColor: Colors.white),
//                     ),
//                   ),

//                   Padding(
//                     padding:
//                         EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
//                     child: TextField(
//                       controller: _confirmpasswordController,
//                       //  controller: passwordController,
//                       style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.bold,
//                       ),
//                       obscureText: _securetext,

//                       decoration: InputDecoration(
//                           suffixIconColor: Colors.deepOrange,
//                           focusedBorder: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(20),
//                               borderSide: BorderSide(
//                                 color: Colors.deepOrangeAccent,
//                                 width: 2,
//                               )),
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(20),
//                           ),
//                           labelText: "Confirm password",
//                           hintText: "Please Re-enter Password ..",
//                           hintStyle: TextStyle(fontWeight: FontWeight.w300),
//                           labelStyle: TextStyle(
//                               color: Colors.deepOrange,
//                               fontWeight: FontWeight.bold),
//                           suffixIcon: IconButton(
//                               onPressed: () {
//                                 setState(() {
//                                   _securetext = !_securetext;
//                                 });
//                               }, 
//                               icon: Icon(_securetext
//                                   ? Icons.remove_red_eye
//                                   : Icons.security_outlined)),
//                           filled: true,
//                           fillColor: Colors.white),
//                     ),
//                   ),
//                   SizedBox(height: 30), // This is for gaping

//                   Padding(
//                       padding:
//                           EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
//                       child: ElevatedButton(
//                         child: Text(
//                           "Sign up",
//                           style: TextStyle(color: Colors.white),
//                         ),
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.deepOrange,
//                           fixedSize: Size(300, 50),
//                           textStyle: TextStyle(
//                             color: Colors.white,
//                             fontSize: 20,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         onPressed: () {
//                           var valEmailId = _emailController.text;
//                           var valPass = _passwordController.text;
//                           var valConfirmPass = _confirmpasswordController.text;
//                           var valName = _nameController.text;
//                           var valMobile = _mobileController.text;

//                           if (valName.isEmpty == true) {
//                             ShowMySnackBar("Please Enter Your Name");
//                           }
//                           if (valMobile.isEmpty == true) {
//                             ShowMySnackBar("Please Enter Mobile No.");
//                           }
//                           if (valEmailId.isEmpty == true) {
//                             ShowMySnackBar("Please Enter Email Id");
//                           }
//                           if (valPass.isEmpty == true) {
//                             ShowMySnackBar("Please Enter Password");
//                           }
//                           if (valConfirmPass.isEmpty == true) {
//                             ShowMySnackBar("Please Re-Enter Password");
//                           } else {
//                             signUp();
//                           }

//                           Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => Landing()));
//                         },
//                       )),
//                   SizedBox(height: 10),

//                   //signup

//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text('Already a member ?'),
//                       GestureDetector(
//                         onTap: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(builder: (context) {
//                               return Login();
//                             }),
//                           );
//                         },
//                         child: Text(
//                           ' Login now',
//                           style: TextStyle(
//                             color: Colors.deepOrange,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                     ],
//                   )
//                   // SizedBox(height: 100),
//                 ]))));
//   }
// }
