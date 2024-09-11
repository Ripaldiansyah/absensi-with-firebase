import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hyper_ui/core.dart';

class RequestLeaveService {
  Future<List<Map<String, dynamic>>> getLeaveByCurrentUser() async {
    try {
      List<Map<String, dynamic>> leaves = [];
      User? user = FirebaseAuth.instance.currentUser;

      var requestLeave = await FirebaseFirestore.instance
          .collection('leave_request')
          .doc(await getCurrentId())
          .collection('request')
          .get();

      for (var doc in requestLeave.docs) {
        // Fetch the data from the  reference
        var responseData = await doc.data()['response'].get();
        leaves.add({
          'title': doc.data()['title'],
          'requestDate': doc.data()['requestDate'],
          'startLeave': doc.data()['startLeave'],
          'endLeave': doc.data()['endLeave'],
          'description': doc.data()['description'],
          'response': responseData.data() // Add the request data if needed
        });
      }
      return leaves;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future searchLeave(String text) async {
    try {
      List<Map<String, dynamic>> leaves = [];
      User? user = FirebaseAuth.instance.currentUser;

      var requestLeave = await FirebaseFirestore.instance
          .collection('leave_request')
          .doc(user?.uid)
          .collection('request')
          .where('title', isGreaterThanOrEqualTo: text)
          .where('title', isLessThanOrEqualTo: text + '\uf8ff')
          .get();

      for (var doc in requestLeave.docs) {
        leaves.add(doc.data());
      }

      return leaves;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> insertLeaveRequest(Map<String, dynamic> leaveData) async {
    try {
      await FirebaseFirestore.instance
          .collection('leave_request')
          .doc(await getCurrentId())
          .collection('request')
          .add(leaveData);
    } catch (e) {
      print(e);
      throw Exception(e);
    }
  }
}
