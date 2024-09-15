import 'package:cloud_firestore/cloud_firestore.dart';

import '../../core.dart';

class ResponseSickService {
  Future<List<Map<String, dynamic>>> getAllUserSick(
      List<Map<String, dynamic>> users) async {
    try {
      List<Map<String, dynamic>> userSicks = [];

      for (var user in users) {
        Map<String, dynamic> userSick = {};

        var requestSick = await FirebaseFirestore.instance
            .collection('sick_request')
            .doc(await user["userId"])
            .collection('request')
            .get();
        userSick = {"user": user};
        int index = 1;
        int countPending = 0;
        for (var doc in requestSick.docs) {
          var responseData = await doc.data()['response'].get();
          userSick["request $index"] = doc.data();
          userSick['response $index'] = responseData.data();
          responseData.data()["status"] == "pending"
              ? countPending++
              : countPending;
          index++;
        }
        userSick["user"]["countPending"] = countPending;
        userSicks.add(userSick);
      }
      return userSicks;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<Map<String, dynamic>>> getSickByUser(String userId) async {
    try {
      List<Map<String, dynamic>> sicks = [];

      var requestSick = await FirebaseFirestore.instance
          .collection('sick_request')
          .doc(userId)
          .collection('request')
          .get();

      for (var doc in requestSick.docs) {
        // Fetch the data from the  reference
        var responseData = await doc.data()['response'].get();
        sicks.add({
          'title': doc.data()['title'],
          'requestDate': doc.data()['requestDate'],
          'startDate': doc.data()['startDate'],
          'endDate': doc.data()['endDate'],
          'docUrl': doc.data()['docUrl'],
          'description': doc.data()['description'],
          'idResponse': doc.data()['idResponse'],
          'userIdEmployee': userId,
          'response': responseData.data() // Add the request data if needed
        });
      }
      return sicks;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future searchSick(String text, String userId) async {
    try {
      List<Map<String, dynamic>> sicks = [];

      var requestSick = await FirebaseFirestore.instance
          .collection('sick_request')
          .doc(userId)
          .collection('request')
          .where('title', isGreaterThanOrEqualTo: text)
          .where('title', isLessThanOrEqualTo: text + '\uf8ff')
          .get();

      for (var doc in requestSick.docs) {
        var responseSick = await FirebaseFirestore.instance
            .collection('sick_request')
            .doc(userId)
            .collection('response')
            .doc(doc["idResponse"])
            .get();
        var responseSickData = responseSick.data() as Map<String, dynamic>;
        sicks.add({
          ...doc.data(),
          'response': responseSickData,
        });
      }

      return sicks;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future searchUserSick(String text) async {
    try {
      final users = await UsersService().getAllUsers();
      final userSicks = await ResponseSickService().getAllUserSick(users);
      List<Map<String, dynamic>> userSick = [];
      for (var sick in userSicks) {
        if (sick["user"]["name"].toString().contains(text)) {
          userSick.add(sick);
        }
      }

      return userSick;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> approvalSick(String responseId, String userIdEmployee,
      Map<String, dynamic> responseData) async {
    try {
      await FirebaseFirestore.instance
          .collection('sick_request')
          .doc(userIdEmployee)
          .collection("response")
          .doc(responseId)
          .update(responseData);
    } catch (e) {
      throw Exception(e);
    }
  }
}
