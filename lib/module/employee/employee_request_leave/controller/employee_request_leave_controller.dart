import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hyper_ui/service/request_leave_service/request_leave_service.dart';
import 'package:hyper_ui/shared/util/log/log.dart';
import '../state/employee_request_leave_state.dart';
import 'package:hyper_ui/bloc_util.dart';
import 'package:injectable/injectable.dart';

@singleton
class EmployeeRequestLeaveController extends Cubit<EmployeeRequestLeaveState>
    implements IBlocBase {
  EmployeeRequestLeaveController() : super(EmployeeRequestLeaveState());

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

  getRequestLeaves() async {
    try {
      return await RequestLeaveService().getLeaveByCurrentUser();
    } catch (e) {
      se(e);
    }
  }

  searchLeaves(String text) async {
    try {
      return await RequestLeaveService().searchLeave(text);
    } catch (e) {
      se(e);
    }
  }
}
