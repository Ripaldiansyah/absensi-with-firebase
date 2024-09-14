
import 'package:freezed_annotation/freezed_annotation.dart';
part 'employee_request_leave_detail_state.freezed.dart';

@unfreezed
class EmployeeRequestLeaveDetailState with _$EmployeeRequestLeaveDetailState {
  factory EmployeeRequestLeaveDetailState({
    @Default(0) int counter,
  }) = _EmployeeRequestLeaveDetailState;
}
    
    