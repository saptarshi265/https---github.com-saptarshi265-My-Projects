// import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:yumm/screens/bottomnav.dart';



class Landing extends StatefulWidget {
  const Landing({super.key});

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  
  //   int _selectedIndex = 0;
  // PageController pageController = PageController();
  // void onTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  
  //   pageController.jumpToPage(index);
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // endDrawer: const Navbar(
        
      // ),
      // extendBody: true,


      appBar: AppBar(
       // leading: IconButton(onPressed: () =>Navigator(, icon: Icon.backs),
//         backgroundColor: Colors.transparent,
//         flexibleSpace: FlexibleSpaceBar(background: Container(
//     decoration: BoxDecoration(gradient: LinearGradient( colors: [
           
//             Color.fromARGB(255, 130, 3, 3),
//              Colors.deepOrange,
//           ],
//           begin: Alignment.bottomCenter,
//           end: Alignment.topCenter,
//           )),
// ),),
        title: Center(child: Text('Welcome to Yumm',style: TextStyle(fontFamily: 'PlaywriteGBS',color: Colors.deepOrange))),
        
        
      ),
          bottomNavigationBar: BottomNav(),
      
      body: 
          
            Container(
               
              child: Column(
                children: [

                  Text("Hello !! Arnab"),
                  // PageView(
                    
                  //   controller: pageController,
                  //   children: [
                  //      Navigator(
                  //   onGenerateRoute: (settings) => MaterialPageRoute(
                  //   builder: (context) => Order(),)),
                  // Navigator(
                  //   onGenerateRoute: (settings) => MaterialPageRoute(
                  //   builder: (context) => Delivery(),)),
                  
                             
                  
                  // Navigator(
                  //   onGenerateRoute: (settings) => MaterialPageRoute(
                  //   builder: (context) => Payment(),)),
                  
                  // Navigator(
                  //   onGenerateRoute: (settings) => MaterialPageRoute(
                  //   builder: (context) => Landing(),)),
                  
                  // Navigator(
                  // onGenerateRoute: (settings) => MaterialPageRoute(
                  //   builder: (context) => UserDashbord(),)),
                  
                    // ],
                  // ),
                ],
              ),
            ),
      // bottomNavigationBar: BottomNavigationBar(
      //   items: const <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(icon: Icon(Icons.food_bank), label: 'Order'),
          
      //     BottomNavigationBarItem(icon: Icon(Icons.food_bank_outlined), label: 'Best Seller'),
      //     BottomNavigationBarItem(icon: Icon(Icons.payment_outlined), label: 'Payment'),
      //    BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
      //     //BottomNavigationBarItem(icon: Icon(Icons.person), label: 'User Dashbord'),
      //   ],
      //   currentIndex: _selectedIndex,
      //   selectedItemColor: Colors.blueAccent,
      //   unselectedItemColor: Colors.grey,
      //   onTap: onTapped,
      // )
    );
  }
}