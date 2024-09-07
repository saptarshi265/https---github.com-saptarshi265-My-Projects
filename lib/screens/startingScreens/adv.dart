import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:yumm/screens/startingScreens/skip1.dart';

//import 'package:flutter/src/rendering/box.dart';
class Adv extends StatefulWidget {
  const Adv({super.key});

  @override
  State<Adv> createState() => _AdvState();
}

class _AdvState extends State<Adv> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.infinity,
          height: double.infinity,
          //color: const Color.fromARGB(255, 241, 61, 7),
          decoration: const BoxDecoration(
            image: DecorationImage(
              
             image: AssetImage("assets/images/Biriyani2.jpg"),
              fit: BoxFit.cover ,
            ),
          ),
          //child: SingleChildScrollView(
            child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
              children: [
                

              Container(
                
                alignment: Alignment.bottomCenter,
                child: Text("Are You Hungry ?",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 30,fontFamily:'PlaywriteGBS' ),)),
               SizedBox(height: 30,),
                 Padding(
              padding: EdgeInsets.all(10),
              child: ElevatedButton(
                child: Text( "Get Started",style: TextStyle(color: Colors.deepOrange),),

                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(248, 247, 246, 1),
                  fixedSize: Size(200, 50),
                  textStyle:  TextStyle(
                    color: Colors.deepOrange,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () { 
                   Navigator.push(context,
       MaterialPageRoute(builder: (context) => Skip1()));
                 },
              )
              ),
             SizedBox(height: 40,)
              ],
            )),
         // )
          ),
    );
  }
}