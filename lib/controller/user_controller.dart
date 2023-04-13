

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../modules/user_module.dart';

class UserController {

  Future<Users?> readUser() async{
    final SharedPreferences pref = await SharedPreferences.getInstance();
    final id = pref.getString('userID');
    final docUser = FirebaseFirestore.instance.collection('users').doc(id);
    final snapshot = await docUser.get();

    if (snapshot.exists){
      return Users.fromMap(snapshot.data()!);
    }
  }
}