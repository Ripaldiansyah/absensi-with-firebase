class PresentService {
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
}
