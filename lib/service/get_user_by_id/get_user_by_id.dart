import 'package:cloud_firestore/cloud_firestore.dart';

Future<Map<String, dynamic>?> getUserById(String userId) async {
  try {
    DocumentSnapshot userDoc =
        await FirebaseFirestore.instance.collection('users').doc(userId).get();
    if (userDoc.exists) {
      Map<String, dynamic> userData = userDoc.data() as Map<String, dynamic>;
      return userData;
    }
  } catch (e) {
    print(e);
    throw new Exception(e);
  }
  return null;
}
