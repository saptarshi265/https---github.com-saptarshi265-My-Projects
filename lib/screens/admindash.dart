import 'package:flutter/material.dart';
import 'package:yumm/screens/adminnavbar.dart';

class Admindash extends StatefulWidget {
  const Admindash({super.key});

  @override
  State<Admindash> createState() => _AdmindashState();
}

class _AdmindashState extends State<Admindash> {
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: 
      AppBar(
        title: Text("Admin Dashbord"),
      ),
      bottomNavigationBar: Adminnavbar(),
    );
  }
}