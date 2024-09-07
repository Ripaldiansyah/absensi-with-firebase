import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> getUserById(String userId) async {
  try {
    DocumentSnapshot userDoc =
        await FirebaseFirestore.instance.collection('users').doc(userId).get();
    if (userDoc.exists) {
      Map<String, dynamic> userData = userDoc.data() as Map<String, dynamic>;
      print("User data: $userData");
    } else {
      print("User not found");
    }
  } catch (e) {
    print("Error getting user: $e");
  }
}
