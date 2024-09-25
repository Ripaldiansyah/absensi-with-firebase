import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hyper_ui/core.dart';

class presenceService {
  Future<List<Map<String, dynamic>>> getPresence(
      String monthYear, String dateMonthYear) async {
    try {
      List<Map<String, dynamic>> userPresence = [];

      final users = await UsersService().getAllUsers();

      for (Map<String, dynamic> user in users) {
        var presenceData = await FirebaseFirestore.instance
            .collection('attendance')
            .doc(user["userId"])
            .collection(monthYear)
            .doc(dateMonthYear)
            .get();

        Map<String, dynamic> userData = presenceData.data() ??
            {
              "checkIn": null,
              "checkOut": null,
            };
        userData["name"] = user["name"];
        userData["idEmployee"] = user["idEmployee"];
        userData["role"] = user["role"];
        userPresence.add(userData);
      }
      userPresence.sort((a, b) {
        Timestamp? timestampA = a['checkIn'] as Timestamp?;
        Timestamp? timestampB = b['checkIn'] as Timestamp?;

        if (timestampA == null && timestampB == null) return 0;
        if (timestampA == null) return 1;
        if (timestampB == null) return -1;

        return timestampA.compareTo(timestampB);
      });

      return userPresence;
    } catch (e) {
      throw Exception(e);
    }
  }

  List<Map<String, dynamic>> getDate(String monthYear) {
    List<Map<String, dynamic>> dates = [];
    DateTime firstDayOfMonth = DateFormat('MMMM yyyy').parse(monthYear);
    int daysInMonth =
        DateTime(firstDayOfMonth.year, firstDayOfMonth.month + 1, 0).day;

    for (int i = 1; i <= daysInMonth; i++) {
      DateTime date = DateTime(firstDayOfMonth.year, firstDayOfMonth.month, i);
      dates.add({
        "label": DateFormat('d MMMM yyyy').format(date),
        "value": DateFormat('dd MMMM yyyy').format(date),
      });
    }
    return dates;
  }
}
