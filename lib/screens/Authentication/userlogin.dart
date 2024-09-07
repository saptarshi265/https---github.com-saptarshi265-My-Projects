import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:yumm/screens/Authentication/login.dart';
import 'package:yumm/screens/Authentication/registeration.dart';

import 'package:yumm/widget/custom-widget.dart';
class Userlogin extends StatefulWidget {
  const Userlogin({super.key});

  @override
  State<Userlogin> createState() => _UserloginState();
}

class _UserloginState extends State<Userlogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       // title: Text("User Login"),

      ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          alignment: Alignment.center,
          //color: const Color.fromARGB(255, 241, 61, 7),
          // decoration: const BoxDecoration(
          //   image: DecorationImage(
              
          //    image: AssetImage("assets/images/food.png"),
          //     fit: BoxFit.cover ,
          //   ),
          // ),
          //   decoration: BoxDecoration(gradient: LinearGradient( colors: [
           
          //   Color.fromRGBO(252, 251, 251, 1),
          //    Colors.black,
          // ],
          // begin: Alignment.bottomCenter,
          // end: Alignment.topCenter,
          // )),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
                          children: [
            // const SizedBox(height: 50
            // ,),
            
                           Container(
                           height: 300,
            width: 300,
            child:
          Lottie.network("https://lottie.host/554fd8b9-3ef8-44ad-9171-bdad466bf58e/UY5fu1nFsX.json"),

            //  Image.asset("assets/images/logo-color.png")
                          //   child:  const CircleAvatar(
                          //     backgroundImage: AssetImage("assets/images/logo-color.png") ,
                          //   ),
                           ),
            
            SizedBox(height: 50), // This is for gaping
            RichText(text: TextSpan(
              children: [
                TextSpan(text: "Login or Register as ",style: TextStyle(color: Colors.black,fontSize: 23)),
                TextSpan(text: "User", style: Mywidget.skipText())
              ]
            )),
            SizedBox(height: 34,),
                     
            Padding(
                          padding: EdgeInsets.all(10),
                          child: ElevatedButton(
            child: Text("Log in",style: TextStyle(color: Colors.white),),
            
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepOrange,
              fixedSize: Size(300, 50),
              textStyle:  TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: () { 
               Navigator.push(context,
                   MaterialPageRoute(builder: (context) => Login()));
             },
                          )
                          ),
             Padding(
                          padding: EdgeInsets.all(10),
                          child: ElevatedButton(
            child: Text("Register",style: TextStyle(color: Colors.white)),
            
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepOrange,
              fixedSize: Size(300, 50),
              textStyle:  TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: () { 
               Navigator.push(context,
                   MaterialPageRoute(builder: (context) => Register()));
             },
                          )
                          ),
                         
                          ],
                        ),
          )),
    );
  }
}