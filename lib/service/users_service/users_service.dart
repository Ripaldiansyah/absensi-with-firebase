import 'package:cloud_firestore/cloud_firestore.dart';

class UsersService {
  Future<void> getAllUser() async {
    try {
      QuerySnapshot userDocs =
          await FirebaseFirestore.instance.collection('users').get();

      if (userDocs.docs.isNotEmpty) {
        DocumentSnapshot userDoc = userDocs.docs.first;
        Map<String, dynamic> userData = userDoc.data() as Map<String, dynamic>;
        print("User data: $userData");
      } else {
        print("User not found");
      }
    } catch (e) {
      print("Error getting user: $e");
    }
  }
}
