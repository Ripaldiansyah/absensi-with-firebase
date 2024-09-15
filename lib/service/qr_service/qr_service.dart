import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:min_id/min_id.dart';

class QrService {
  Future<Map<String, dynamic>?> getDataQr(Map<String, dynamic> userData) async {
    try {
      DocumentReference reference = FirebaseFirestore.instance
          .collection('qr_codes')
          .doc(userData["userId"]);

      await reference.set({
        'userId': userData["userId"],
        'idEmployee': userData["idEmployee"],
        "secretKey": MinId.getId('SMP{10{w}}{3{d}}'),
      });

      // Ambil dokumen setelah disimpan
      DocumentSnapshot snapshot = await reference.get();
      return snapshot.data()
          as Map<String, dynamic>?; // Kembalikan data sebagai Map
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Map<String, dynamic>?> updateDataQr(
      Map<String, dynamic> userData) async {
    try {
      DocumentReference reference = FirebaseFirestore.instance
          .collection('qr_codes')
          .doc(userData["userId"]);

      await reference.set({
        'userId': userData["userId"],
        'idEmployee': userData["idEmployee"],
        "secretKey": null,
      });

      DocumentSnapshot snapshot = await reference.get();
      return snapshot.data() as Map<String, dynamic>?;
    } catch (e) {
      throw Exception(e);
    }
  }
}
