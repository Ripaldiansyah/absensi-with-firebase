import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hyper_ui/service/activity_service/activity_service.dart';
import '../../../../core.dart';
import '../state/employee_activity_state.dart';
import 'package:hyper_ui/bloc_util.dart';
import 'package:injectable/injectable.dart';

@singleton
class EmployeeActivityController extends Cubit<EmployeeActivityState>
    implements IBlocBase {
  EmployeeActivityController() : super(EmployeeActivityState());

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

  getHistoryAttendance(String monthYear) async {
    try {
      final history = await ActivityService().getAttendanceHistory(monthYear);
      if (!isClosed) {
        emit(state.copyWith(history: history));
      }
    } catch (e) {
      print(e);
      se(e);
    }
  }

  getMonth() {
    return ActivityService().getMonth();
  }
}
