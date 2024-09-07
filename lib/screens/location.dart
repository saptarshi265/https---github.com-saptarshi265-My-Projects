import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:yumm/screens/landing.dart';
import 'package:yumm/service/shared_pref.dart';
import 'package:yumm/widget/custom-widget.dart';
import 'package:lottie/lottie.dart';
//import 'package:current_location/current_location.dart';
class Location extends StatefulWidget {
  const Location({super.key});

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  String Location="";
  TextEditingController LocationController = new TextEditingController();


  String? id;
 getthesharedpref() async {
    id = await SharedPreferenceHelper().getUserId();
    print('user id $id');
    setState(() {});
  }

  ontheload() async {
    await getthesharedpref();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    ontheload();}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(
    
    ),

body: Container(
  height: double.infinity,
  width: double.infinity,
  child: SingleChildScrollView(
    child: Column(
      mainAxisAlignment:MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("Location",style:Mywidget.skipText(),),
        SizedBox(height: 20,),
        Lottie.network("https://lottie.host/8559f541-391a-4791-86ec-9fc201651ec4/rPbSyNIZZy.json",height: 140,width: 140),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Material(
           // elevation: 6,
            borderRadius: BorderRadius.circular(10),
            child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Color(0xFFececf8),
                        borderRadius: BorderRadius.circular(10)),
                    child: TextField(
                      maxLines: 3,
                      controller: LocationController,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Location",
                          hintStyle: AppWidget.LightTextFeildStyle()),
                    ),
                  ),
          ),
        ),

        SizedBox(height: 10,),
         Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
                      child: ElevatedButton(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,

                          children: [
                           Padding(
                             padding: const EdgeInsets.all(10),
                             child: Icon(Icons.upload,color: Colors.white,),
                           ),

                            Text(
                              "Upload Location",
                              style: TextStyle(color: Colors.white,),
                            ),
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                          elevation: 6,
 
                          backgroundColor: Colors.deepOrange,
                          fixedSize: Size(250, 50),
                          textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ), onPressed: () async{
                        Map<String, dynamic> addlocation = {
                          'Location': LocationController.text,
                          
                        };
                        await addLocation(addlocation, id!);
        await SharedPreferenceHelper().saveUserLocation(LocationController.text);

                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.orangeAccent,
            content: Text(
              " added Successfully",
              style: TextStyle(fontSize: 18.0),
            )));
              Navigator.push(
          context, MaterialPageRoute(builder: (context) => Landing()));
             },
               )  ),

      ],
    ),
  ),
)
    );
  }
  addLocation(Map<String, dynamic> addUserInfo, String Id) async {
    return await FirebaseFirestore.instance
        .collection('user')
        .doc(Id)
        .collection('Location')
        .add(addUserInfo);
  }
}