import 'dart:async';

import 'package:flutter/material.dart';
import 'package:yumm/screens/startingScreens/adv.dart';
class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(Duration(seconds: 2), (){

Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => Adv(),));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.deepOrange,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        // decoration: BoxDecoration(gradient: LinearGradient( colors: [
           
        //     Color.fromARGB(255, 130, 3, 3),
        //      Colors.deepOrange,
        //   ],
        //   begin: Alignment.bottomCenter,
        //   end: Alignment.topCenter,
        //   )),
        child: Center(
          child: Container(
            height: 450,
            width: 450,
            //color: Colors.deepOrange,
            
              child:  Padding(
                padding: const EdgeInsets.all(20),
                child: Image.asset("assets/images/logo-no-background.png"),
              )
            
            
          ),
        
        ),
      ),
    );
  }
}