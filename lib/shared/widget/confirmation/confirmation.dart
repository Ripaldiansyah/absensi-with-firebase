import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';

class Confirmation {
  const Confirmation({
    Key? key,
    required this.description,
  });
  final String description;

  Future<Map<String, dynamic>> showConfirmationDialog(
      BuildContext context) async {
    bool confirm = false;
    String? message;
    Map<String, dynamic>? result;

    result = await showDialog<Map<String, dynamic>>(
          context: context,
          barrierDismissible: true,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Konfirmasi'),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Text('${description}'),
                    const SizedBox(
                      height: 10.0,
                    ),
                    QTextField(
                      label: "Pesan",
                      validator: Validator.required,
                      value: null,
                      onChanged: (value) {
                        message = value;
                      },
                    ),
                  ],
                ),
              ),
              actions: <Widget>[
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[600],
                  ),
                  onPressed: () {
                    result = {
                      "result": false,
                      "message": message ?? "-",
                    };
                    Navigator.pop(context, result);
                  },
                  child: const Text(
                    "No",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                  ),
                  onPressed: () {
                    confirm = true;
                    result = {
                      "result": confirm,
                      "message": message ?? "-",
                    };
                    Navigator.pop(context, result);
                  },
                  child: Text(
                    "Yes",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            );
          },
        ) ??
        result;

    return result ?? {"result": false, "message": "-"};
  }
}
