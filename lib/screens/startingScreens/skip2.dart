import 'package:flutter/material.dart';
// import 'package:yumm/main.dart';
import 'package:lottie/lottie.dart';
import 'package:yumm/screens/Authentication/home.dart';
import 'package:yumm/screens/startingScreens/skip3.dart';
import 'package:yumm/widget/custom-widget.dart';

class Skip2 extends StatefulWidget {
  const Skip2({super.key});

  @override
  State<Skip2> createState() => _Skip2State();
}

class _Skip2State extends State<Skip2> {
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
            
                    textAlign: TextAlign.right,
                  ),
                  onPressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => Home()));
                  },
                  iconAlignment: IconAlignment.end,
                ),
              ),
               Container(
                height: 400,
                width: 300,
                alignment: Alignment.center,
                child: Lottie.network("https://lottie.host/42b78ada-666c-4ef8-a0ba-d504adc37d90/48Xr1rdPrY.json")
                // Image.asset("assets/images/drink.png" ,height: 200,width: 300,),
                
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Chose your favourite dishes  !",style: Mywidget.skipText(),textAlign: TextAlign.center,),
              ),
              SizedBox(height: 20,),
             
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Chose dishes of your liking form yumm",style: TextStyle(color: const Color.fromARGB(255, 171, 145, 145),fontWeight: FontWeight.bold),),
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
                            MaterialPageRoute(builder: (context) => Skip3()));
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