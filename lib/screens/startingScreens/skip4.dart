import 'package:flutter/material.dart';
// import 'package:yumm/main.dart';
import 'package:lottie/lottie.dart';
import 'package:yumm/screens/Authentication/home.dart';
import 'package:yumm/widget/custom-widget.dart';
class Skip4 extends StatefulWidget {
  const Skip4({super.key});

  @override
  State<Skip4> createState() => _Skip4State();
}

class _Skip4State extends State<Skip4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
         height: double.infinity,
        width: double.infinity,
        //color: Colors.blueAccent,
        child:
         SingleChildScrollView(
           child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
           
            children: [
             SizedBox(height: 100, ),
              Container(
                height: 350,
                width: 300,
                alignment: Alignment.center,
                child: Lottie.network('https://lottie.host/2a4b0d26-b264-4b62-b0c7-27e9c79911f6/hFfM5LR174.json',),
               
                //Image.asset("assets/images/food-delivery.png" ,height: 200,width: 300,),
                
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text("Get your food at your door steps !",style: Mywidget.skipText(),textAlign: TextAlign.center,),
              ),
              //SizedBox(height: 15,),
             
              Padding(
                padding: const EdgeInsets.only(top: 10,bottom: 10,right: 30,left: 30),
                
                child: Text("Order your food and we will deliver your meal on your door steps within 30 minutes  ",style: TextStyle(color: const Color.fromARGB(255, 171, 145, 145),fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
              ),
              SizedBox(height: 20,),
              
             Container(
              //color: Colors.amber,
              alignment: Alignment.bottomCenter,
                child: Padding(
                    padding: EdgeInsets.all(10),
                    child: ElevatedButton(
                      child:
                          Text("Next", style: TextStyle(color: Colors.white)),
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
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Home()));
                      },
                    )),
              ),
            ],
                   ),
         ),
      ),
    );
  }
}