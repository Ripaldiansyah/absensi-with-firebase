import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';

class login_title extends StatelessWidget {
  const login_title({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Selamat Datang",
          style: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          "Aplikasi Absen",
          style: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            color: primaryColor,
          ),
        ),
        Text(
          "Silahkan masuk untuk melanjutkan",
          style: TextStyle(
            fontSize: 14.0,
            color: secondaryTextColor,
          ),
        ),
      ],
    );
  }
}
