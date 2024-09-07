import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods{
   Future addFoodToCart(Map<String, dynamic> UserInfoMap, String id) async {
    return await FirebaseFirestore.instance
        .collection('user')
        .doc(id)
        .collection("Cart")
        .add(UserInfoMap);
  }
}