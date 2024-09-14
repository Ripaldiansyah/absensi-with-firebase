import 'package:cloud_firestore/cloud_firestore.dart';

import '../../core.dart';

class ResponsePermitService {
  Future<List<Map<String, dynamic>>> getAllUserPermit(
      List<Map<String, dynamic>> users) async {
    try {
      List<Map<String, dynamic>> userPermits = [];

      for (var user in users) {
        Map<String, dynamic> userPermit = {};

        var requestPermit = await FirebaseFirestore.instance
            .collection('permit_request')
            .doc(await user["userId"])
            .collection('request')
            .get();
        userPermit = {"user": user};
        int index = 1;
        int countPending = 0;
        for (var doc in requestPermit.docs) {
          var responseData = await doc.data()['response'].get();
          userPermit["request $index"] = doc.data();
          userPermit['response $index'] = responseData.data();
          responseData.data()["status"] == "pending"
              ? countPending++
              : countPending;
          index++;
        }
        userPermit["user"]["countPending"] = countPending;
        userPermits.add(userPermit);
      }
      return userPermits;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<Map<String, dynamic>>> getPermitByUser(String userId) async {
    try {
      List<Map<String, dynamic>> permits = [];

      var requestPermit = await FirebaseFirestore.instance
          .collection('permit_request')
          .doc(userId)
          .collection('request')
          .get();

      for (var doc in requestPermit.docs) {
        // Fetch the data from the  reference
        var responseData = await doc.data()['response'].get();
        permits.add({
          'title': doc.data()['title'],
          'requestDate': doc.data()['requestDate'],
          'startPermit': doc.data()['startLeave'],
          'description': doc.data()['description'],
          'idResponse': doc.data()['idResponse'],
          'userIdEmployee': userId,
          'response': responseData.data() // Add the request data if needed
        });
      }
      return permits;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future searchPermit(String text, String userId) async {
    try {
      List<Map<String, dynamic>> permits = [];

      var requestPermit = await FirebaseFirestore.instance
          .collection('permit_request')
          .doc(userId)
          .collection('request')
          .where('title', isGreaterThanOrEqualTo: text)
          .where('title', isLessThanOrEqualTo: text + '\uf8ff')
          .get();

      for (var doc in requestPermit.docs) {
        var responsePermit = await FirebaseFirestore.instance
            .collection('permit_request')
            .doc(userId)
            .collection('response')
            .doc(doc["idResponse"])
            .get();
        var responsePermitData = responsePermit.data() as Map<String, dynamic>;
        permits.add({
          ...doc.data(),
          'response': responsePermitData,
        });
      }

      return permits;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future searchUserPermit(String text) async {
    try {
      final users = await UsersService().getAllUsers();
      final userPermits = await ResponsePermitService().getAllUserPermit(users);
      List<Map<String, dynamic>> userPermit = [];
      for (var permit in userPermits) {
        if (permit["user"]["name"].toString().contains(text)) {
          userPermit.add(permit);
        }
      }

      return userPermit;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> approvalPermit(String responseId, String userIdEmployee,
      Map<String, dynamic> responseData) async {
    try {
      await FirebaseFirestore.instance
          .collection('permit_request')
          .doc(userIdEmployee)
          .collection("response")
          .doc(responseId)
          .update(responseData);
    } catch (e) {
      throw Exception(e);
    }
  }
}
