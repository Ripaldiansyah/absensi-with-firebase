import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hyper_ui/service/auth_service/auth_service.dart';

class RequestSickService {
  Future<List<Map<String, dynamic>>> getSickByCurrentUser() async {
    try {
      List<Map<String, dynamic>> sicks = [];

      var requestSick = await FirebaseFirestore.instance
          .collection('sick_request')
          .doc(await getCurrentId())
          .collection('request')
          .get();

      for (var doc in requestSick.docs) {
        var responseData = await doc.data()['response'].get();
        sicks.add({
          'title': doc.data()['title'],
          'requestDate': doc.data()['requestDate'],
          'startDate': doc.data()['startDate'],
          'endDate': doc.data()['endDate'],
          'description': doc.data()['description'],
          'idResponse': doc.data()['idResponse'],
          'response': responseData.data() // Add the request data if needed
        });
      }
      return sicks;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future searchSick(String text) async {
    try {
      List<Map<String, dynamic>> sicks = [];
      User? user = FirebaseAuth.instance.currentUser;

      var requestSick = await FirebaseFirestore.instance
          .collection('sick_request')
          .doc(user?.uid)
          .collection('request')
          .where('title', isGreaterThanOrEqualTo: text)
          .where('title', isLessThanOrEqualTo: text + '\uf8ff')
          .get();

      for (var doc in requestSick.docs) {
        var responseSick = await FirebaseFirestore.instance
            .collection('sick_request')
            .doc(user?.uid)
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

  Future insertSickRequest(Map<String, dynamic> sickData) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;

      DocumentReference reference = await FirebaseFirestore.instance
          .collection('sick_request')
          .doc(user?.uid)
          .collection('response')
          .add({
        'message': "-",
        'operator': "-",
        'responseDate': null,
        'status': "pending",
      });

      DocumentReference request = await FirebaseFirestore.instance
          .collection('sick_request')
          .doc(user?.uid)
          .collection('request')
          .add({
        ...sickData,
        'idResponse': reference.id,
        'response': reference,
      });

      String sickId = request.id;

      await reference.update({
        'idRequest': sickId,
      });
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> updateSickRequest(
      String sickId, Map<String, dynamic> updatedData) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;

      await FirebaseFirestore.instance
          .collection('sick_request')
          .doc(user?.uid)
          .collection('request')
          .doc(sickId)
          .update(updatedData);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> deleteSickRequest(
    String responseId,
    String requestId,
  ) async {
    print(responseId);
    print(requestId);
    try {
      User? user = FirebaseAuth.instance.currentUser;

      await FirebaseFirestore.instance
          .collection('sick_request')
          .doc(user?.uid)
          .collection('request')
          .doc(requestId)
          .delete();

      await FirebaseFirestore.instance
          .collection('sick_request')
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
