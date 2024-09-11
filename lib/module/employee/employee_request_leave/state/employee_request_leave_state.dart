import 'package:freezed_annotation/freezed_annotation.dart';
part 'employee_request_leave_state.freezed.dart';

@unfreezed
class EmployeeRequestLeaveState with _$EmployeeRequestLeaveState {
  factory EmployeeRequestLeaveState({
    @Default(0) int counter,
    @Default(null) List? requestLeaves,
  }) = _EmployeeRequestLeaveState;
}
