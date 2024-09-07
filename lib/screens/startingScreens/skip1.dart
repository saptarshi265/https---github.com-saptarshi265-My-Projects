import 'package:flutter/material.dart';
// import 'package:yumm/main.dart';
import 'package:lottie/lottie.dart';
import 'package:yumm/screens/Authentication/home.dart';
import 'package:yumm/screens/startingScreens/skip2.dart';
import 'package:yumm/widget/custom-widget.dart';

class Skip1 extends StatefulWidget {
  const Skip1({super.key});

  @override
  State<Skip1> createState() => _Skip1State();
}

class _Skip1State extends State<Skip1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
       // color: Colors.amber,
        child: SingleChildScrollView(
          child: Column(
          //  mainAxisAlignment: MainAxisAlignment.center,
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
                child: Lottie.network("https://lottie.host/e1327176-2cdc-4c20-9c53-ba0068e7a01e/manYBupnst.json")
                //Image.asset("assets/images/online-order.png" ,height: 200,width: 300,),
                
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Food on your fingure tips !", style: Mywidget.skipText(
                  
                ),textAlign: TextAlign.center,),
              ),
              SizedBox(height: 20,),
             
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Food like your mom's special dishes ",style: TextStyle(color: const Color.fromARGB(255, 171, 145, 145),fontWeight: FontWeight.bold,),),
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
                            MaterialPageRoute(builder: (context) => Skip2()));
                      },
                    )),
              ),
              SizedBox(height: 40,),
          
            ],
          ),
        ),
      ),
    );
  }
}
