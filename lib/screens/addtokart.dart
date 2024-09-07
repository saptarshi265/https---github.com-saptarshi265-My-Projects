import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';


import 'package:yumm/service/shared_pref.dart';
import 'package:yumm/widget/custom-widget.dart';

class Order extends StatefulWidget {
  const Order({super.key});

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
  String? Id,address,phone,email,name;
  int total = 0;
String? order=" ",Order="";
  void startTimer() {
    Timer(Duration(seconds: 1), () {
      Order=order;
      setState(() {
      });
    });
  }

  getthesharedpref() async {
    Id = await SharedPreferenceHelper().getUserId();
    address=await SharedPreferenceHelper().getUserLocation();
    phone = await SharedPreferenceHelper().getUserPhone();
    email = await SharedPreferenceHelper().getUserEmail();
    name = await SharedPreferenceHelper().getUserName();


    setState(() {});
  }

  ontheload() async {
    await getthesharedpref();
    foodStream = await getFoodCart(Id!);
    setState(() {});
  }

  @override
  void initState() {
    ontheload();
    startTimer();
    super.initState();
  }

  Stream? foodStream;

  Widget foodCart() {
    return StreamBuilder(
        stream: foodStream,
        builder: (context, AsyncSnapshot snapshot) {
          return snapshot.hasData
              ? ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: snapshot.data.docs.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    DocumentSnapshot ds = snapshot.data.docs[index];
                    total = total + int.parse(ds["Total"]);
order="$order"+ds["Name"]+" * "+ds["Quantity"]+" , ";
print(Order);
                    return Container(
                      margin: EdgeInsets.only(
                          left: 20.0, right: 20.0, bottom: 10.0),
                      child: Material(
                        elevation: 5.0,
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10)),
                          padding: EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Container(
                                height: 90,
                                width: 40,
                                decoration: BoxDecoration(
                                    color: Colors.orange,
                                    border: Border.all(),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(
                                    child: Text(
                                  ds["Quantity"],
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                )),
                              ),
                              SizedBox(
                                width: 20.0,
                              ),
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(60),
                                  child: Image.network(
                                    ds["Image"],
                                    height: 90,
                                    width: 90,
                                    fit: BoxFit.cover,
                                  )),
                              SizedBox(
                                width: 20.0,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      ds["Name"],
                                      style: AppWidget.semiBoldTextFeildStyle(),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "Rs " + ds["Total"],
                                        style:
                                            AppWidget.semiBoldTextFeildOrange(),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              IconButton(onPressed: ()async {
                                await deleteFood(Id!, ds["CId"]);

                              }, icon:Icon( Icons.delete,color: Colors.deepOrange,))
                            ],
                          ),
                        ),
                      ),
                    );
                  })
              : CircularProgressIndicator();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 60.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Material(
                elevation: 2.0,
                child: Container(
                    color: Colors.white,
                    padding: EdgeInsets.only(bottom: 10.0),
                    child: Center(
                        child: Text(
                      "Food Cart",
                      style: AppWidget.HeadlineTextFeildOrange(),
                    )))),
            SizedBox(
              height: 20.0,
            ),
            Container(
                height: MediaQuery.of(context).size.height / 1.7,
                child: foodCart()),
            Spacer(),
            
            Divider(),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total Price",
                    style: AppWidget.boldTextFeildStyle(),
                  ),
                  Text(
                    "Rs " + total.toString(),
                    style: AppWidget.semiBoldTextFeildOrange(),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            GestureDetector(
              onTap: ()async {
                    String Oid = randomAlphaNumeric(10);
                   String UOid=Oid;

                      Map<String, dynamic> addFoodtoOrder = {
                          'Item': Order,
                          'Ammount': total.toString(),
                          'CoustomerId': Id,
                          'Name': name,
                          'Email': email,
                          'phone':phone,
                          'Address':address,
                          'OId':Oid,

                        };
                        await addFoodToOrder(addFoodtoOrder, Id!);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          backgroundColor: Colors.orangeAccent,
                          content: Text(
                            "Your Order Is placed",
                            style: TextStyle(fontSize: 18.0),
                          ),
                        ));
                    String AOid = randomAlphaNumeric(10);

                         Map<String, dynamic> addorderAdmin = {
                          'Item': Order,
                          'Ammount': total.toString(),
                          'CoustomerId': Id,
                          'Name': name,
                          'Email': email,
                          'phone':phone,
                          'Address':address,
                          'OId':UOid,
                          'AOId':AOid,
                        };
                        await addOrderAdmin(addorderAdmin, AOid);
                                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          backgroundColor: Colors.orangeAccent,
                          content: Text(
                            "Your order has been placed",
                            style: TextStyle(fontSize: 18.0),
                          ),
                        ));

              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.deepOrange,
                    borderRadius: BorderRadius.circular(20)),
                margin: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
                child: Center(
                    child: Text(
                  "CheckOut",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                )),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<Stream<QuerySnapshot>> getFoodCart(String id) async {
    return await FirebaseFirestore.instance
        .collection('user')
        .doc(id)
        .collection('Cart')
        .snapshots();
  }
  Future addFoodToOrder(Map<String, dynamic> userInfoMap,  String id) async {
    print('User ID: $id'); // Debug statement
    return await FirebaseFirestore.instance
        .collection('user')
        .doc(id)
        .collection("Order")
        .add(userInfoMap);
  }
  Future deleteFood(String id,String cid) async {
    print('User ID: $id'); // Debug statement
    return await FirebaseFirestore.instance
        .collection('user')
        .doc(id)
        .collection("Cart")
        .doc(cid)
        .delete();
  }
   Future addOrderAdmin(Map<String, dynamic> userInfoMap,  String aoid) async {// Debug statement
    return await FirebaseFirestore.instance
        .collection('AdminOrder')
        .doc(aoid)
        .set(userInfoMap);
  }

}
