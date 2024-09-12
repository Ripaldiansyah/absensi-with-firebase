import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../core.dart';

class UsersService {
  Future<List<Map<String, dynamic>>> getAllUsers() async {
    try {
      List<Map<String, dynamic>> users = [];
      QuerySnapshot userDocs =
          await FirebaseFirestore.instance.collection('users').get();

      for (DocumentSnapshot userDoc in userDocs.docs) {
        Map<String, dynamic> userData = userDoc.data() as Map<String, dynamic>;
        userData["userId"] = userDoc.id;
        users.add(userData);
      }
      return users;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<String> getCurrentName() async {
    try {
      var userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(await getCurrentId())
          .get();
      var getCurrentName = userDoc.data()?["name"];
      return getCurrentName!;
    } catch (e) {
      throw Exception(e);
    }
  }
}
