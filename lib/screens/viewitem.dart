import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

// import 'package:yumm/screens/details.dart';
// import 'package:yumm/screens/location.dart';

import 'package:yumm/widget/custom-widget.dart';

class Viewitem extends StatefulWidget {
  const Viewitem({super.key});

  @override
  State<Viewitem> createState() => _ViewitemState();
}

class _ViewitemState extends State<Viewitem> {
  bool biriyani = false, pizza = false, chicken = false, icecream = false,burger =false;
  Stream? fooditemStream;
  ontheload() async {
    fooditemStream = await getFoodItem("Biriyani");
    setState(() {});
  }

  @override
  void initState() {
    ontheload();
    super.initState();
  }

  Widget allItemsVertically() {
    return StreamBuilder(
        stream: fooditemStream,
        builder: (context, AsyncSnapshot snapshot) {
          return snapshot.hasData
              ? ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: snapshot.data.docs.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    DocumentSnapshot ds = snapshot.data.docs[index];
                    return GestureDetector(
                      onTap: () {
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (context) => Details(detail: ds["Detail"],name: ds["Name"],price: ds["Price"],image: ds["Image"],)));
                      },
                    child: Container(
                    margin: EdgeInsets.only(right: 20.0,bottom: 20.0),
                    child: Material(
                      elevation: 5.0,
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        padding: EdgeInsets.all(5),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.network(
                                ds['Image'],
                                height: 120,
                                width: 120,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(
                              width: 20.0,
                            ),
                            Column(
                              children: [
                                Container(
                                    width:
                                        MediaQuery.of(context).size.width / 2,
                                    child: Text(
                                    ds["Name"],
                                      style: AppWidget.semiBoldTextFeildStyle(),
                                    )),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Container(
                                    width:
                                        MediaQuery.of(context).size.width / 2,
                                    child: Text(
                                      ds["Detail"],overflow: TextOverflow.ellipsis,
                                      style: AppWidget.LightTextFeildStyle(),
                                    )),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Container(
                                    width:
                                        MediaQuery.of(context).size.width / 2,
                                    child: Text(
                                      "Rs "+ds["Price"],
                                      style: AppWidget.semiBoldTextFeildStyle(),
                                    ))
                              ],
                            )
                          ],
                        ),
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
     
      body: SafeArea(
        child: Container(
          // margin: EdgeInsets.only( left: 20, right: 10,top: 50),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30.0,
                ),
                 Center(
                   child: RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: "Click on  ",
                        style: TextStyle(color: Colors.black, fontSize: 23)),
                    TextSpan(text: "Menu !!", style: Mywidget.skipText()),
                    
                                   ])),
                 ),
                 SizedBox(height: 30,),
                Container(child: showItem()),
                Center(
                   child: RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: "Added  ",
                        style: TextStyle(color: Colors.black, fontSize: 23)),
                    TextSpan(text: "Items !!", style: Mywidget.skipText()),
                    
                                   ])),
                 ),
                 SizedBox(height: 30,),
                // Padding(
                //   padding: const EdgeInsets.only(left: 20),
                //   child: Text("Menu !!",style: Mywidget.skipText(),),
                // ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: allItemsVertically(),
                ),
                SizedBox(
                  height: 30,
                ),
                
             //e
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget showItem() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: ()async {
                biriyani = true;
                chicken = false;
                icecream = false;
                pizza = false;
                burger=false;
                fooditemStream= await getFoodItem("Biriyani");
                setState(() {});
              },
              child: Material(
                elevation: 10.0,
                borderRadius: BorderRadius.circular(60),
                child: Padding(
                  padding:  biriyani?EdgeInsets.all(1): EdgeInsets.all(8.0),
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      border: biriyani
                          ? Border.all(color: Colors.deepOrange, width: 10)
                          : Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(60),
                    ),
                    child: CircleAvatar(
                      backgroundImage: AssetImage(
                        "assets/images/BiriyaniIcon.jpg",
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: ()async {
                biriyani = false;
                chicken = false;
                icecream = false;
                pizza = false;
                burger=true;
                fooditemStream= await getFoodItem("Burger");
                setState(() {});
              },
              child: Material(
                elevation: 10.0,
                borderRadius: BorderRadius.circular(60),
                child: Padding(
                  padding:  burger?EdgeInsets.all(1): EdgeInsets.all(8.0),
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      border: burger
                          ? Border.all(color: Colors.deepOrange, width: 10)
                          : Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(60),
                    ),
                    child: CircleAvatar(
                      backgroundImage: AssetImage(
                        "assets/images/burgerIcon.jpg",
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () async{
                biriyani = false;
                chicken = true;
                icecream = false;
                pizza = false;
                burger=false;

                fooditemStream= await getFoodItem("Chicken");

                setState(() {});
              },
              child: Material(
                elevation: 10.0,
                borderRadius: BorderRadius.circular(60),
                child: Padding(
                  padding:  chicken?EdgeInsets.all(1): EdgeInsets.all(8.0),
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      border: chicken
                          ? Border.all(color: Colors.deepOrange, width: 10)
                          : Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(60),
                    ),
                    child: CircleAvatar(
                      backgroundImage: AssetImage(
                        "assets/images/ChickenIcon.jpg",
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: ()async {
                biriyani = false;
                chicken = false;
                icecream = false;
                pizza = true;
                burger=false;

                fooditemStream= await getFoodItem("Pizza");

                setState(() {});
              },
              child: Material(
                elevation: 10.0,
                borderRadius: BorderRadius.circular(60),
                child: Padding(
                  padding:  pizza?EdgeInsets.all(1): EdgeInsets.all(8.0),
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      border: pizza
                          ? Border.all(color: Colors.deepOrange, width: 10)
                          : Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(60),
                    ),
                    child: CircleAvatar(
                      backgroundImage: AssetImage(
                        "assets/images/PizzaIcon.jpg",
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () async{
                biriyani = false;
                chicken = false;
                icecream = true;
                pizza = false;
                burger=false;

                fooditemStream= await getFoodItem("Icecream");

                setState(() {});
              },
              child: Material(
                elevation: 10.0,
                borderRadius: BorderRadius.circular(60),
                child: Padding(
                  
                  padding: icecream?EdgeInsets.all(1): EdgeInsets.all(8.0),
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      
                      border: icecream
                          ? Border.all(color: Colors.deepOrange, width: 10)
                          : Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(60),
                    ),
                    child: CircleAvatar(
                      backgroundImage: AssetImage(
                        "assets/images/IceCreamIcon.jpg",
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<Stream<QuerySnapshot>> getFoodItem(String name) async {
    return await FirebaseFirestore.instance.collection(name).snapshots();
  }
}
