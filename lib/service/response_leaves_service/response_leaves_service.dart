import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ResponseLeavesService {
  Future<List<Map<String, dynamic>>> getAllLeave() async {
    try {
      List<Map<String, dynamic>> leaves = [];
      User? user = FirebaseAuth.instance.currentUser;

      // var requestLeave = await FirebaseFirestore.instance
      //     .collection('leave_request')
      //     .doc(await getCurrentId())
      //     .collection('request')
      //     .get();

      // for (var doc in requestLeave.docs) {
      //   // Fetch the data from the  reference
      //   var responseData = await doc.data()['response'].get();
      //   leaves.add({
      //     'title': doc.data()['title'],
      //     'requestDate': doc.data()['requestDate'],
      //     'startLeave': doc.data()['startLeave'],
      //     'endLeave': doc.data()['endLeave'],
      //     'description': doc.data()['description'],
      //     'idResponse': doc.data()['idResponse'],
      //     'response': responseData.data() // Add the request data if needed
      //   });
      // }
      return leaves;
    } catch (e) {
      throw Exception(e);
    }
  }
}
