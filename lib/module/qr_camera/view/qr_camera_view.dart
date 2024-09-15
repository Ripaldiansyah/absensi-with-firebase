import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import 'package:hyper_ui/shared/widget/confirmation/confirmation2.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRViewExample extends StatefulWidget {
  bool isUpdate;
  QRViewExample({
    Key? key,
    required this.isUpdate,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _QRViewExampleState();
}

class _QRViewExampleState extends State<QRViewExample> {
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(flex: 4, child: _buildQrView(context)),
        ],
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 300.0
        : 300.0;

    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: Colors.red,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) async {
      setState(() {
        result = scanData;
      });
      if (result != null) {
        showLoading();
        controller.stopCamera();
        DashboardController dashboardController = DashboardController();
        String? qrCode = result?.code;

        if (qrCode != null) {
          String cleanedCode = qrCode.replaceAll(RegExp(r'[{}]'), '');
          List<String> parts = cleanedCode.split(', ');

          String idEmployee = parts.length > 0 ? parts[0].split(': ')[1] : '';
          String secretKey = parts.length > 1 ? parts[1].split(': ')[1] : '';
          String userId = parts.length > 2 ? parts[2].split(': ')[1] : '';

          if (widget.isUpdate) {
            await dashboardController.insertCheckOut({
              'userId': userId,
              'idEmployee': idEmployee,
              'secretKey': secretKey,
            });
          } else {
            await dashboardController.insertCheckIn({
              'userId': userId,
              'idEmployee': idEmployee,
              'secretKey': secretKey,
            });
          }

          await hideLoading();
          await Get.back();
        }
      }
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
