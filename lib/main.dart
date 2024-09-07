import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yumm/screens/location.dart';
import 'package:yumm/screens/startingScreens/splashscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main()async {
 WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,);
  runApp(Yumm());
}


class Yumm extends StatelessWidget {
  const Yumm({super.key}); 

  @override
  Widget build(BuildContext context) {
    return  ScreenUtilInit(
      designSize: Size(393, 808),
  
      builder:(context,child)=> MaterialApp(
        debugShowCheckedModeBanner: false,
        
        theme: ThemeData(
          primarySwatch: Colors.orange,
        ),
        home:
        // AddFood(),
        // Mainuserscreen(),
        Splashscreen(),
        // Location(),
      ),
      
    );
  }
}

