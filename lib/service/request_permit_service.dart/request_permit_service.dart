import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hyper_ui/service/auth_service/auth_service.dart';

class RequestPermitService {
  Future<List<Map<String, dynamic>>> getPermitByCurrentUser() async {
    try {
      List<Map<String, dynamic>> permits = [];

      var requestPermit = await FirebaseFirestore.instance
          .collection('permit_request')
          .doc(await getCurrentId())
          .collection('request')
          .get();

      for (var doc in requestPermit.docs) {
        var responseData = await doc.data()['response'].get();
        permits.add({
          'title': doc.data()['title'],
          'requestDate': doc.data()['requestDate'],
          'permitDate': doc.data()['permitDate'],
          'description': doc.data()['description'],
          'idResponse': doc.data()['idResponse'],
          'response': responseData.data() // Add the request data if needed
        });
      }
      return permits;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future searchPermit(String text) async {
    try {
      List<Map<String, dynamic>> permits = [];
      User? user = FirebaseAuth.instance.currentUser;

      var requestPermit = await FirebaseFirestore.instance
          .collection('permit_request')
          .doc(user?.uid)
          .collection('request')
          .where('title', isGreaterThanOrEqualTo: text)
          .where('title', isLessThanOrEqualTo: text + '\uf8ff')
          .get();

      for (var doc in requestPermit.docs) {
        var responsePermit = await FirebaseFirestore.instance
            .collection('permit_request')
            .doc(user?.uid)
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

  Future insertPermitRequest(Map<String, dynamic> permitData) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;

      DocumentReference reference = await FirebaseFirestore.instance
          .collection('permit_request')
          .doc(user?.uid)
          .collection('response')
          .add({
        'message': "-",
        'operator': "-",
        'responseDate': null,
        'status': "pending",
      });

      DocumentReference request = await FirebaseFirestore.instance
          .collection('permit_request')
          .doc(user?.uid)
          .collection('request')
          .add({
        ...permitData,
        'idResponse': reference.id,
        'response': reference,
      });

      String permitId = request.id;

      await reference.update({
        'idRequest': permitId,
      });
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> updatePermitRequest(
      String permitId, Map<String, dynamic> updatedData) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;

      await FirebaseFirestore.instance
          .collection('permit_request')
          .doc(user?.uid)
          .collection('request')
          .doc(permitId)
          .update(updatedData);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> deletePermitRequest(
    String responseId,
    String requestId,
  ) async {
    print(responseId);
    print(requestId);
    try {
      User? user = FirebaseAuth.instance.currentUser;

      await FirebaseFirestore.instance
          .collection('permit_request')
          .doc(user?.uid)
          .collection('request')
          .doc(requestId)
          .delete();

      await FirebaseFirestore.instance
          .collection('permit_request')
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
