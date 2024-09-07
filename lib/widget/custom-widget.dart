import 'package:flutter/material.dart';

class Mywidget{

static TextStyle skipText(){
  return TextStyle(
    color: Colors.deepOrange,
    fontSize: 30,
    fontWeight: FontWeight.bold,
    fontFamily:'PlaywriteGBS',);
}
}
const primaryColors = Colors.deepOrange;

class AppWidget{

  static TextStyle boldTextFeildStyle(){
    return  TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  // fontFamily: 'Poppins'
                  );
  }

    static TextStyle HeadlineTextFeildStyle(){
    return  TextStyle(
                  color: Colors.black,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  // fontFamily: 'Poppins'
                  );
  }
   static TextStyle HeadlineTextFeildOrange(){
    return  TextStyle(
                  color: Colors.deepOrange,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                    fontFamily:'PlaywriteGBS',);

  }
   static TextStyle HeadlineTextFeildWhite(){
    return  TextStyle(
                  color: Colors.white,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                    fontFamily:'PlaywriteGBS',);

  }

      static TextStyle LightTextFeildStyle(){
    return  TextStyle(
                  color: Colors.black54,
                  fontSize: 15.0,
                  fontWeight: FontWeight.w500,
                  // fontFamily: 'Poppins'
                  );
  }

        static TextStyle semiBoldTextFeildStyle(){
    return  TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500,
                  // fontFamily: 'Poppins'
                  );
  }
      static TextStyle semiBoldTextFeildStyleW(){
    return  TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500,
                  fontFamily:'PlaywriteGBS',
                  );
  }
   static TextStyle semiBoldTextFeildOrange(){
    return  TextStyle(
                  color: Colors.deepOrange,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500,
                  // fontFamily: 'Poppins'
                  );
  }
}