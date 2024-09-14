import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hyper_ui/service/users_service/users_service.dart';

class ResponseLeavesService {
  Future<List<Map<String, dynamic>>> getAllUserLeave(
      List<Map<String, dynamic>> users) async {
    try {
      List<Map<String, dynamic>> userLeaves = [];

      for (var user in users) {
        Map<String, dynamic> userLeave = {};

        var requestLeave = await FirebaseFirestore.instance
            .collection('leave_request')
            .doc(await user["userId"])
            .collection('request')
            .get();
        userLeave = {"user": user};
        int index = 1;
        int countPending = 0;
        for (var doc in requestLeave.docs) {
          var responseData = await doc.data()['response'].get();
          userLeave["request $index"] = doc.data();
          userLeave['response $index'] = responseData.data();
          responseData.data()["status"] == "pending"
              ? countPending++
              : countPending;
          index++;
        }
        userLeave["user"]["countPending"] = countPending;
        userLeaves.add(userLeave);
      }
      // print(userLeaves);
      return userLeaves;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<Map<String, dynamic>>> getLeaveByUser(String userId) async {
    try {
      List<Map<String, dynamic>> leaves = [];

      var requestLeave = await FirebaseFirestore.instance
          .collection('leave_request')
          .doc(userId)
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
          'userIdEmployee': userId,
          'response': responseData.data() // Add the request data if needed
        });
      }
      return leaves;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future searchLeave(String text, String userId) async {
    try {
      List<Map<String, dynamic>> leaves = [];

      var requestLeave = await FirebaseFirestore.instance
          .collection('leave_request')
          .doc(userId)
          .collection('request')
          .where('title', isGreaterThanOrEqualTo: text)
          .where('title', isLessThanOrEqualTo: text + '\uf8ff')
          .get();

      for (var doc in requestLeave.docs) {
        var responseLeave = await FirebaseFirestore.instance
            .collection('leave_request')
            .doc(userId)
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

  Future searchUserLeave(String text) async {
    try {
      final users = await UsersService().getAllUsers();
      final userLeaves = await ResponseLeavesService().getAllUserLeave(users);
      List<Map<String, dynamic>> userLeave = [];
      for (var leave in userLeaves) {
        if (leave["user"]["name"].toString().contains(text)) {
          userLeave.add(leave);
        }
      }

      return userLeave;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> approvalLeave(String responseId, String userIdEmployee,
      Map<String, dynamic> responseData) async {
    try {
      await FirebaseFirestore.instance
          .collection('leave_request')
          .doc(userIdEmployee)
          .collection("response")
          .doc(responseId)
          .update(responseData);
    } catch (e) {
      throw Exception(e);
    }
  }
}
