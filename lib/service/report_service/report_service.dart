import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io';
import 'package:excel/excel.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../core.dart';

class ReportService {
  Future reportDailyPresence() async {
    try {
      String monthYear = DateFormat('MMMM yyyy').format(now);
      String dateMonthYear = DateFormat('dd MMMM yyyy').format(now);

      final users = await UsersService().getAllUsers();

      List<Map<String, dynamic>> historyPresence = [];
      for (Map<String, dynamic> user in users) {
        var attendanceData = await FirebaseFirestore.instance
            .collection('attendance')
            .doc(user["userId"])
            .collection(monthYear)
            .doc(dateMonthYear)
            .get();

        Map<String, dynamic> userPresence = attendanceData.data() ??
            {
              "checkIn": null,
              "checkOut": null,
              "idEmployee": user["idEmployee"],
              "userId": user["userId"],
              "name": user["name"],
              "role": user["role"]
            };

        if (userPresence["idEmployee"] == null) {
          userPresence["idEmployee"] = user["idEmployee"];
          userPresence["userId"] = user["userId"];
        }
        historyPresence.add(userPresence);
      }

      return generateExcelReportDaily(historyPresence);
    } catch (e) {
      print('Error mengambil data: $e');
    }
  }

  Future reportMonthlyPresence(String monthYear) async {
    try {
      List<Map<String, dynamic>> userPresence = [];

      final users = await UsersService().getAllUsers();

      DateTime firstDayOfMonth = DateFormat('MMMM yyyy').parse(monthYear);
      int daysInMonth =
          DateTime(firstDayOfMonth.year, firstDayOfMonth.month + 1, 0).day;

      for (Map<String, dynamic> user in users) {
        for (int day = 1; day <= daysInMonth; day++) {
          String dateMonthYear = DateFormat('dd MMMM yyyy').format(
              DateTime(firstDayOfMonth.year, firstDayOfMonth.month, day));

          var attendanceData = await FirebaseFirestore.instance
              .collection('attendance')
              .doc(user["userId"])
              .collection(monthYear)
              .doc(dateMonthYear)
              .get();

          var userPresenceData = attendanceData.data() ??
              {
                "checkIn": null,
                "checkOut": null,
              };
          userPresenceData["date"] = dateMonthYear;
          userPresenceData["name"] = user["name"];
          userPresenceData["idEmployee"] = user["idEmployee"];
          userPresenceData["role"] = user["role"];
          userPresenceData["userId"] = user["userId"];

          userPresence.add(userPresenceData);
        }
      }
      await checkAndRequestPermission();

      return generateExcelReportMonthly(userPresence);
    } catch (e) {
      // Log error if necessary
      throw Exception('Failed to get presence data: $e');
    }
  }

  Future<void> generateExcelReportMonthly(List<dynamic> data) async {
    try {
      var excel = Excel.createExcel(); // Create a new Excel file

      // Group data by date
      Map<String, List<dynamic>> groupedData = {};
      for (var entry in data) {
        String dateKey = convertStringToDate(entry['date']);
        if (dateKey.isNotEmpty) {
          if (!groupedData.containsKey(dateKey)) {
            groupedData[dateKey] = [];
          }
          groupedData[dateKey]!.add(entry);
        }
      }

      // Create a sheet for each date
      groupedData.forEach((dateKey, userEntries) {
        Sheet sheet = excel[dateKey]; // Create a new sheet with the date

        // Add header
        sheet.appendRow([
          TextCellValue('User Name'),
          TextCellValue('Check In'),
          TextCellValue('Check Out'),
        ]);

        // Add user data
        for (var entry in userEntries) {
          sheet.appendRow([
            TextCellValue(entry['name']),
            entry['checkIn'] is Timestamp
                ? DateTimeCellValue.fromDateTime(
                    (entry['checkIn'] as Timestamp).toDate())
                : TextCellValue('N/A'),
            entry['checkOut'] is Timestamp
                ? DateTimeCellValue.fromDateTime(
                    (entry['checkOut'] as Timestamp).toDate())
                : TextCellValue('N/A'),
          ]);
        }
      });

      // Remove the default "Sheet1" if it exists
      excel.delete('Sheet1');

      // Let the user choose a directory to save the file
      String? directoryPath = await FilePicker.platform.getDirectoryPath();
      if (directoryPath != null) {
        DateTime date = DateFormat('dd MMMM yyyy').parse(data[0]['date']);
        String monthYear = DateFormat('MMMM yyyy').format(date);
        String filePath = '$directoryPath/report_monthly_$monthYear.xlsx';
        File file = File(filePath);
        await file.writeAsBytes(excel.encode()!);

        print('File saved at: $filePath');
      } else {
        print('No directory selected.');
      }
    } catch (e) {
      print("Error generating Excel report: $e");
    }
  }

  Future<void> generateExcelReportDaily(List<dynamic> data) async {
    try {
      var excel = Excel.createExcel(); // Create a new Excel file

      // Get current date in the specified format
      String dateMonthYear = DateFormat('dd MMMM yyyy').format(DateTime.now());
      Sheet sheet =
          excel[dateMonthYear]; // Create a new sheet with the current date

      // Add header
      sheet.appendRow([
        TextCellValue('User Name'),
        TextCellValue('Check In'),
        TextCellValue('Check Out'),
      ]);

      // Add user data
      for (var entry in data) {
        sheet.appendRow([
          TextCellValue(entry['name']),
          entry['checkIn'] != null
              ? DateTimeCellValue.fromDateTime(entry['checkIn'])
              : TextCellValue('N/A'),
          entry['checkOut'] != null
              ? DateTimeCellValue.fromDateTime(entry['checkOut'])
              : TextCellValue('N/A'),
        ]);
      }

      // Remove the default "Sheet1" if it exists
      excel.delete('Sheet1');

      // Let the user choose a directory to save the file
      String? directoryPath = await FilePicker.platform.getDirectoryPath();
      if (directoryPath != null) {
        String filePath = '$directoryPath/report_daily_$dateMonthYear.xlsx';
        File file = File(filePath);
        await file.writeAsBytes(excel.encode()!);

        print('File saved at: $filePath');
      } else {
        print('No directory selected.');
      }
    } catch (e) {
      print("Error generating Excel report: $e");
    }
  }

  Future<void> checkAndRequestPermission() async {
    var status = await Permission.storage.status;
    if (!status.isGranted) {
      await Permission.storage.request();
    }
  }

  String convertStringToDate(String dateStr) {
    try {
      DateTime dateTime = DateFormat('d MMMM y').parse(dateStr);
      return DateFormat('dd MMMM yyyy')
          .format(dateTime); // Format as "01 September 2024"
    } catch (e) {
      print('Error parsing date: $e');
      return ''; // Return an empty string if parsing fails
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
