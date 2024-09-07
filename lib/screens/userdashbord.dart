
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:yumm/screens/Authentication/home.dart';
import 'package:yumm/service/shared_pref.dart';
import 'package:yumm/widget/custom-widget.dart';
class UserDashbord extends StatefulWidget {
  const UserDashbord({super.key});

  @override
  State<UserDashbord> createState() => _UserDashbordState();
}

class _UserDashbordState extends State<UserDashbord> {
  String? name ,email,address,Id;
  

  
  getthesharedpref()async{
    // profile= await SharedPreferenceHelper().getUserProfile();
    name= await SharedPreferenceHelper().getUserName();
    email= await SharedPreferenceHelper().getUserEmail();
    address=await SharedPreferenceHelper().getUserLocation();
    Id= await SharedPreferenceHelper().getUserId();
    setState(() {
      print(name);
      print(email);
      print(address);
      print(Id);
    });
      }
ontheload()async{
await getthesharedpref();
setState(() {
  
});
}
@override
  void initState() {
    ontheload();
    // uploadItem();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        toolbarHeight: 80,
        elevation: 6,
        backgroundColor: Colors.deepOrange,
        
      ),
    // endDrawer: Navbar(),
      body:name==null? CircularProgressIndicator(): Container(
        color: Colors.white,
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Material(
                elevation: 6,
                borderRadius: BorderRadius.circular(70),
                // color: Colors.deepOrange,
                child: CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('assets/images/user.png',),
                                )
                    ),
                
              
             
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Material(
                  elevation: 6,
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                     height: 80,
                    // width: 300,
                    decoration: BoxDecoration(color: Colors.blueGrey[50],
                    borderRadius: BorderRadius.circular(20)),
                    
                    child: Row(
                      children: [
                         Padding(
                          padding: const EdgeInsets.all(20),
                          child: Icon(Icons.person,color: Colors.deepOrange,)
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("Name",style: AppWidget.boldTextFeildStyle(),),
                            Text(
                              name!,
                              style:AppWidget.LightTextFeildStyle(),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Material(
                   elevation: 6,
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                     height: 80,
                    // width: 300,
                    decoration: BoxDecoration(color: Colors.blueGrey[50],
                    borderRadius: BorderRadius.circular(20)),
                    
                    child: Row(
                      children: [
                         Padding(
                          padding: const EdgeInsets.all(20),
                          child: Icon(Icons.mail,color: Colors.deepOrange,)
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                        
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("Email",style: AppWidget.boldTextFeildStyle(),),
                            Text(
                              email!,
                              style: AppWidget.LightTextFeildStyle(),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Material(
                   elevation: 6,
                  borderRadius: BorderRadius.circular(20),
                  child: Expanded(
                    child: Container(
                       height: 150,
                      // width: 300,
                      decoration: BoxDecoration(color: Colors.blueGrey[50],
                      borderRadius: BorderRadius.circular(20)),
                      
                      child:address==null? CircularProgressIndicator(): Row(
                        
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: Icon(Icons.location_on,color: Colors.deepOrange,),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                          
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              
                              Text("Address",style: AppWidget.boldTextFeildStyle(),),
                              
                              Text(
                                address!,
                                style:AppWidget.LightTextFeildStyle(),
                              ),
                              
                            ],
                          ),
                    
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              // SizedBox(height: 10),
             Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
                      child: ElevatedButton(
                        
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Icon(Icons.logout,color: Colors.white,),
                            ),
                            Text(
                              "Log Out",
                              style: TextStyle(color: Colors.white),
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
                        ), onPressed: () {   Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const Home()));
                         },
               )  ),
             // SizedBox(height: 10),
              // Padding(
              //         padding:
              //             EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
              //         child: ElevatedButton(
              //           child: Row(
              //             mainAxisAlignment: MainAxisAlignment.center,

              //             children: [
              //              GestureDetector(
              //               onTap: ()async {
              //               print(Id);
              //                   await deleteProfile(Id!);
                                

                             
              //               },
              //                child: Padding(
              //                  padding: const EdgeInsets.all(10),
              //                  child: Icon(Icons.delete,color: Colors.white,),
              //                ),
              //              ),

              //               Text(
              //                 "Delete Profile",
              //                 style: TextStyle(color: Colors.white),
              //               ),
              //             ],
              //           ),
              //           style: ElevatedButton.styleFrom(
              //             elevation: 6,

              //             backgroundColor: Colors.deepOrange,
              //             fixedSize: Size(250, 50),
              //             textStyle: TextStyle(
              //               color: Colors.white,
              //               fontSize: 20,
              //               fontWeight: FontWeight.bold,
              //             ),
              //           ), onPressed: () {  },
              //  )  ),
              SizedBox(height: 10),
             
            ],
          ),
        ),
      ),
    );
  }
   Future<Stream<QuerySnapshot>> getFoodCart(String id) async {
    return await FirebaseFirestore.instance
        .collection('user')
        .doc(id)
        .collection('Location')
        .snapshots();
  }
  //   Future deleteProfile(String id) async {
  //   print('User ID: $id'); // Debug statement
  //   return await FirebaseFirestore.instance
  //       .collection('user')
  //       .doc(id)
  //      .delete();
  // }
}
