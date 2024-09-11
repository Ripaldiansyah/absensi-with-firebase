import 'package:freezed_annotation/freezed_annotation.dart';
part 'employee_form_request_leave_state.freezed.dart';

@unfreezed
class EmployeeFormRequestLeaveState with _$EmployeeFormRequestLeaveState {
  factory EmployeeFormRequestLeaveState({
    @Default(0) int counter,
    @Default(null) String? title,
    @Default(null) DateTime? startLeave,
    @Default(null) DateTime? endLeave,
    @Default(null) String? description,
  }) = _EmployeeFormRequestLeaveState;
}
