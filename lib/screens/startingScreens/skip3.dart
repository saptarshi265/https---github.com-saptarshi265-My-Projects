import 'package:flutter/material.dart';
// import 'package:yumm/main.dart';
import 'package:lottie/lottie.dart';
import 'package:yumm/screens/Authentication/home.dart';
import 'package:yumm/screens/startingScreens/skip4.dart';
import 'package:yumm/widget/custom-widget.dart';

class Skip3 extends StatefulWidget {
  const Skip3({super.key});

  @override
  State<Skip3> createState() => _Skip3State();
}

class _Skip3State extends State<Skip3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Container(
         height: double.infinity,
        width: double.infinity,
        child: 
        SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
          
            children: [
              SizedBox(height: 40,width: double.infinity,),
              Container(
                
                alignment: Alignment.topRight,
                padding: EdgeInsets.all(20),
                child: TextButton(
                  child: Text(
                    "skip >",
                    style: TextStyle(color: Colors.deepOrange,fontSize: 22),
          
                   // textAlign: TextAlign.center,
                  ),
                  onPressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => Home()));
                  },
                  iconAlignment: IconAlignment.end,
                ),
              ),
               Container(
                height: 350,
                width: 300,
                alignment: Alignment.center,
                child: Lottie.network("https://lottie.host/8538ca80-4d26-4802-9f9d-9651ef6c2e19/EpU2HYGKAK.json")
                //Image.asset("assets/images/money.png" ,height: 200,width: 300,),
                
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text("Get amazing offers & discounts !",style: Mywidget.skipText(),textAlign: TextAlign.center,),
              ),
              SizedBox(height: 15,),
             
              Padding(
                padding: const EdgeInsets.only(top: 10,bottom: 10,right: 30,left: 30),
                child: Text("Choose  offers , coupons , discounts  that suits you before ordering  ",style: TextStyle(color: const Color.fromARGB(255, 171, 145, 145),fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
              ),
              SizedBox(height: 20,),
              
              Container(
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
                            MaterialPageRoute(builder: (context) => Skip4()));
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