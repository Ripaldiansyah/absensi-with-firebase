import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hyper_ui/core.dart';

class RequestLeaveService {
  Future<List<Map<String, dynamic>>> getLeaveByCurrentUser() async {
    try {
      List<Map<String, dynamic>> leaves = [];

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
          'idResponse': doc.data()['idResponse'],
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
        var responseLeave = await FirebaseFirestore.instance
            .collection('leave_request')
            .doc(user?.uid)
            .collection('response')
            .doc(doc["idResponse"])
            .get();
        var responseLeaveData = responseLeave.data() as Map<String, dynamic>;
        leaves.add({
          ...doc.data(),
          'response': responseLeaveData,
        });
      }

      return leaves;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future insertLeaveRequest(Map<String, dynamic> leaveData) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;

      DocumentReference reference = await FirebaseFirestore.instance
          .collection('leave_request')
          .doc(user?.uid)
          .collection('response')
          .add({
        'message': "-",
        'operator': "-",
        'responseDate': null,
        'status': "pending",
      });

      DocumentReference request = await FirebaseFirestore.instance
          .collection('leave_request')
          .doc(user?.uid)
          .collection('request')
          .add({
        ...leaveData,
        'idResponse': reference.id,
        'response': reference,
      });

      String leaveId = request.id;

      await reference.update({
        'idRequest': leaveId,
      });
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> updateLeaveRequest(
      String leaveId, Map<String, dynamic> updatedData) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;

      await FirebaseFirestore.instance
          .collection('leave_request')
          .doc(user?.uid)
          .collection('request')
          .doc(leaveId)
          .update(updatedData);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> deleteLeaveRequest(
    String responseId,
    String requestId,
  ) async {
    print(responseId);
    print(requestId);
    try {
      User? user = FirebaseAuth.instance.currentUser;

      await FirebaseFirestore.instance
          .collection('leave_request')
          .doc(user?.uid)
          .collection('request')
          .doc(requestId)
          .delete();

      await FirebaseFirestore.instance
          .collection('leave_request')
          .doc(user?.uid)
          .collection('response')
          .doc(responseId)
          .delete();
    } catch (e) {
      print(e);
      throw Exception(e);
    }
  }
}
