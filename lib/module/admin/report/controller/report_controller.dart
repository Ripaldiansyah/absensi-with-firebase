import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hyper_ui/service/report_service/report_service.dart';
import '../state/report_state.dart';
import 'package:hyper_ui/bloc_util.dart';
import 'package:injectable/injectable.dart';

@singleton
class ReportController extends Cubit<ReportState> implements IBlocBase {
  ReportController() : super(ReportState());

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

  emitView() {
    emit(state.copyWith());
  }

  getDailyDataPresence() async {
    try {
      await ReportService().reportDailyPresence();
    } catch (e) {}
  }

  getMonthlyDataPresence(String monthYear) async {
    try {
      await ReportService().reportMonthlyPresence(monthYear);
    } catch (e) {}
  }

  getMonth() {
    return ReportService().getMonth();
  }
}
