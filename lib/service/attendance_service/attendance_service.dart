import 'package:cloud_firestore/cloud_firestore.dart';

import '../../core.dart';

class AttendanceService {
  Future<Map<String, dynamic>> getAttendanceTodayByUser() async {
    try {
      String monthYear = DateFormat('MMMM yyyy').format(now);
      String dateMonthYear = DateFormat('dd MMMM yyyy').format(now);
      var attendanceData = await FirebaseFirestore.instance
          .collection('attendance')
          .doc(await getCurrentId())
          .collection(monthYear)
          .doc(dateMonthYear);
      DocumentSnapshot snapshot = await attendanceData.get();

      if (!snapshot.exists) {
        await attendanceData.set({
          "checkIn": null,
          "checkOut": null,
        });

        return attendanceData as Map<String, dynamic>;
      } else {
        Map<String, dynamic> attendance = {
          "checkIn": snapshot.get("checkIn"),
          "checkOut": snapshot.get("checkOut"),
        };

        return attendance;
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<bool> validateQR(Map<String, dynamic> qrData) async {
    try {
      var attendanceData = await FirebaseFirestore.instance
          .collection('qr_codes')
          .doc(await getCurrentId())
          .get();

      if (attendanceData.exists) {
        if (attendanceData["userId"] != qrData["userId"]) {
          return false;
        }
        if (attendanceData["idEmployee"] != qrData["idEmployee"]) {
          print(attendanceData["idEmployee"] != qrData["idEmployee"]);
          return false;
        }
        if (attendanceData["secretKey"] != qrData["secretKey"]) {
          print(attendanceData["secretKey"] != qrData["secretKey"]);
          return false;
        }
        return true;
      }
      return false; // Tambahkan return false jika tidak ada data
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Map<String, dynamic>?> insertAttendance(
      Map<String, dynamic> qrData) async {
    try {
      String monthYear = DateFormat('MMMM yyyy').format(now);
      String dateMonthYear = DateFormat('dd MMMM yyyy').format(now);
      DocumentReference<Map<String, dynamic>> reference = FirebaseFirestore
          .instance
          .collection('attendance')
          .doc(qrData["userId"])
          .collection(monthYear)
          .doc(dateMonthYear);

      await checkIn(reference, qrData);
      await QrService().updateDataQr(qrData);
      DocumentSnapshot snapshot = await reference.get();
      return snapshot.data() as Map<String, dynamic>?;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Map<String, dynamic>?> UpdateAttendance(
      Map<String, dynamic> qrData) async {
    try {
      String monthYear = DateFormat('MMMM yyyy').format(now);
      String dateMonthYear = DateFormat('dd MMMM yyyy').format(now);
      DocumentReference<Map<String, dynamic>> reference = FirebaseFirestore
          .instance
          .collection('attendance')
          .doc(qrData["userId"])
          .collection(monthYear)
          .doc(dateMonthYear);

      await checkOut(reference, qrData);

      DocumentSnapshot snapshot = await reference.get();
      return snapshot.data() as Map<String, dynamic>?;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> checkIn(DocumentReference<Map<String, dynamic>> reference,
      Map<String, dynamic> qrData) async {
    try {
      await reference.set({
        'userId': qrData["userId"],
        'idEmployee': qrData["idEmployee"],
        'checkIn': Timestamp.now(),
        'checkOut': null
      });
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> checkOut(DocumentReference<Map<String, dynamic>> reference,
      Map<String, dynamic> qrData) async {
    try {
      await reference.update(
        {'checkOut': Timestamp.now()},
      );
    } catch (e) {
      throw Exception(e);
    }
  }
}
