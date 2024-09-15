import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hyper_ui/service/qr_service/qr_service.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../../../../../core.dart';
import '../state/admin_qr_generator_state.dart';
import 'package:hyper_ui/bloc_util.dart';
import 'package:injectable/injectable.dart';

@singleton
class AdminQrGeneratorController extends Cubit<AdminQrGeneratorState>
    implements IBlocBase {
  AdminQrGeneratorController() : super(AdminQrGeneratorState());

  @override
  void initState() {}

  @override
  void dispose() {
    //dispose event
  }

  @override
  void ready() {
    //ready event
  }

  printAnything(dynamic anything) {
    print(anything);
  }

  qrData(Map<String, dynamic> userData) async {
    try {
      final qrData = await QrService().getDataQr(userData);
      final qrCode = QrCode(
        10,
        QrErrorCorrectLevel.H,
      )..addData(qrData.toString());

      return QrImage(qrCode);
    } catch (e) {
      print(e);
      se(e);
    }
  }
}
