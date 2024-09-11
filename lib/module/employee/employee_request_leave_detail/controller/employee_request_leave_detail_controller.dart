
import 'package:flutter_bloc/flutter_bloc.dart';
import '../state/employee_request_leave_detail_state.dart';
import 'package:hyper_ui/bloc_util.dart';
import 'package:injectable/injectable.dart';

@singleton
class EmployeeRequestLeaveDetailController extends Cubit<EmployeeRequestLeaveDetailState> implements IBlocBase {
  EmployeeRequestLeaveDetailController() : super(EmployeeRequestLeaveDetailState());

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
    
      
    