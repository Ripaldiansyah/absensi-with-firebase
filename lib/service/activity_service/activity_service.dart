import 'package:cloud_firestore/cloud_firestore.dart';

import '../../core.dart';

class ActivityService {
  Future<List<Map<String, dynamic>>> getAttendanceHistory(
      String monthYear) async {
    try {
      List<Map<String, dynamic>> historyAttendance = [];
      var attendanceData = await FirebaseFirestore.instance
          .collection('attendance')
          .doc(await getCurrentId())
          .collection(monthYear)
          .get();

      for (DocumentSnapshot history in attendanceData.docs) {
        Map<String, dynamic> historyData =
            history.data() as Map<String, dynamic>;
        historyAttendance.add(historyData);
      }

      return historyAttendance;
    } catch (e) {
      throw Exception(e);
    }
  }

  List<Map<String, dynamic>> getMonth() {
    List<Map<String, dynamic>> months = [];
    DateTime now = DateTime.now();
    DateTime start = DateTime(now.year - 1, now.month + 1);

    for (int i = 0; i < 12; i++) {
      DateTime month = DateTime(start.year, start.month + i);
      months.add({
        "label": DateFormat('MMMM yyyy').format(month),
        "value": DateFormat('MMMM yyyy').format(month),
      });
    }
    return months;
  }
}
