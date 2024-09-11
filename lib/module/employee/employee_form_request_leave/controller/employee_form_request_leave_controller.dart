
import 'package:flutter_bloc/flutter_bloc.dart';
import '../state/employee_form_request_leave_state.dart';
import 'package:hyper_ui/bloc_util.dart';
import 'package:injectable/injectable.dart';

@singleton
class EmployeeFormRequestLeaveController extends Cubit<EmployeeFormRequestLeaveState> implements IBlocBase {
  EmployeeFormRequestLeaveController() : super(EmployeeFormRequestLeaveState());

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

  increment() {
    state.counter++;
    emit(state.copyWith());
  }
}
    
      
    