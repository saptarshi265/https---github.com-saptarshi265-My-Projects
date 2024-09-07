import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yumm/screens/addtokart.dart';
import 'package:yumm/screens/mainuserscreen.dart';
import 'package:yumm/screens/userdashbord.dart';
import 'package:yumm/screens/myorder.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int currentTabIndex = 0;

  late List<Widget> pages;
  late Widget currentPage;
  late Mainuserscreen homepage;
  late UserDashbord profile;
  late Order order;
  late Myorder myorder;

  @override
  void initState() {
    homepage = Mainuserscreen();
    order = Order();
    profile = UserDashbord();
    myorder = Myorder();
    pages = [homepage, order, myorder, profile];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          items: [
            
              FaIcon(FontAwesomeIcons.bowlRice,
              color: Colors.white,
            ),
            Icon(
              Icons.shopping_cart,
              color: Colors.white,
            ),
            Icon(
              Icons.wallet_outlined,
              color: Colors.white,
            ),
            Icon(
              Icons.person_outline,
              color: Colors.white,
            )
          ],
          ),
      body: pages[currentTabIndex], 
    );
  }
}
