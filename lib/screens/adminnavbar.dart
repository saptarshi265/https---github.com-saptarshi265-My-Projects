import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:yumm/screens/add-item.dart';
import 'package:yumm/screens/add_food.dart';
import 'package:yumm/screens/adminorder.dart';

// import 'package:yumm/screens/payment.dart';

import 'package:yumm/screens/viewitem.dart';
// import 'package:yumm/screens/myorder.dart';


class Adminnavbar extends StatefulWidget {
  const Adminnavbar({super.key});

  @override
  State<Adminnavbar> createState() => _AdminnavbarState();
}

class _AdminnavbarState extends State<Adminnavbar> {


  int currentTabIndex = 0;

  late List<Widget> pages;
  late Widget currentPage;
  late AddFood addItem;
  late Viewitem viewitem;
  // late Payment payment;
 late Adminorder AdminOrder;

  @override
  void initState() {
    addItem = AddFood();
    viewitem = Viewitem();
   // addItem = UserDashbord();
    AdminOrder = Adminorder();
    pages = [ viewitem,addItem, AdminOrder];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      // appBar: AppBar(
        
      // ),
        
      // extendBody: true,

        bottomNavigationBar: CurvedNavigationBar(
          height: 65,
          backgroundColor: Colors.white,
          color: Colors.deepOrange,
          animationDuration: Duration(milliseconds: 500),
          onTap: (int index) {
            setState(() {
              currentTabIndex = index;
            });
          },
          items:  [
          
            Icon(
              Icons.food_bank_outlined,
              color: Colors.white,
            ),
             FaIcon(FontAwesomeIcons.bowlFood,
              color: Colors.white,
            ),
            Icon(
              Icons.payment_outlined,
              color: Colors.white,
            ),
            // Icon(
            //   Icons.person_outline,
            //   color: Colors.white,
            // )
          ],
          ),
      body: pages[currentTabIndex], 
    );
  }
}
