import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hyper_ui/service/attendance_service/attendance_service.dart';
import 'package:hyper_ui/shared/util/log/log.dart';
import '../../../core.dart';
import '../state/dashboard_state.dart';
import 'package:hyper_ui/bloc_util.dart';
import 'package:injectable/injectable.dart';

@singleton
class DashboardController extends Cubit<DashboardState> implements IBlocBase {
  DashboardController() : super(DashboardState());

  @override
  void initState() {
    //initState event
  }

  @override
  void dispose() {
    //dispose event
  }

  @override
  void ready() {
    //ready event
  }

  emitData() {
    emit(state.copyWith());
  }

  getAttendance() async {
    try {
      final attendance = await AttendanceService().getAttendanceTodayByUser();
      emit(state.copyWith(attendance: attendance));
      return attendance;
    } catch (e) {
      print(e);
    }
  }

  insertCheckIn(Map<String, dynamic> qrData) async {
    try {
      if (await AttendanceService().validateQR(qrData)) {
        final attendance = await AttendanceService().insertAttendance(qrData);
        await GetIt.I<DashboardController>().getAttendance();
        return attendance;
      } else {
        se("Pastikan nama yang dipilih sesuai dan QR yang digunakan adalah yang terbaru.");
      }
    } catch (e) {
      print(e);
    }
  }

  insertCheckOut(Map<String, dynamic> qrData) async {
    try {
      if (await AttendanceService().validateQR(qrData)) {
        final attendance = await AttendanceService().UpdateAttendance(qrData);
        await GetIt.I<DashboardController>().getAttendance();
        return attendance;
      } else {
        se("Pastikan nama yang dipilih sesuai dan QR yang digunakan adalah yang terbaru.");
      }
    } catch (e) {
      print(e);
    }
  }
}
