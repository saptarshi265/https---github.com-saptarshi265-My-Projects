import 'package:flutter/material.dart';
import 'package:yumm/screens/Authentication/adminlogin.dart';
import 'package:yumm/screens/Authentication/userlogin.dart';
// import 'package:yumm/screens/startingScreens/splashscreen.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

class Home extends StatefulWidget {
  const Home({super.key}); 

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
   
      body: Container(
          width: double.infinity,
          height: double.infinity,
          alignment: Alignment.center,
         
          child: SingleChildScrollView(
            child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
              
                          children: [
            const SizedBox(height: 70
            ,),
            
                           Container(
             height: 400,
            width: 400,
            child: Image.asset("assets/images/Yumm.png")
            ),
                           
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text("Delight in Every Bite,Right at Your Doorstep!",style: TextStyle(fontFamily: 'PlaywriteGBS',color: Colors.deepOrangeAccent,fontWeight: FontWeight.bold),),
            ),
                          SizedBox(height: 50),  // This is for gaping
            
                     
            Padding(
                          padding: EdgeInsets.all(10),
                          child: ElevatedButton(
            child: Text("Admin",style: TextStyle(color: Colors.white),),
            
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
                   MaterialPageRoute(builder: (context) => Adminlogin()));
             },
                          )
                          ),
            
                           Padding(
                          padding: EdgeInsets.all(10),
                          child: ElevatedButton(
            child: Text("User",style: TextStyle(color: Colors.white),),
            
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
                   MaterialPageRoute(builder: (context) => Userlogin()));
             },
                          )
                          ),
                          ],
                        ),
          )),
    );
  }
}
