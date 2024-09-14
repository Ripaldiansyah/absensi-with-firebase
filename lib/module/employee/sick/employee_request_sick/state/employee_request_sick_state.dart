import 'package:freezed_annotation/freezed_annotation.dart';
part 'employee_request_sick_state.freezed.dart';

@unfreezed
class EmployeeRequestSickState with _$EmployeeRequestSickState {
  factory EmployeeRequestSickState({
    @Default(null) List? sicks,
  }) = _EmployeeRequestSickState;
}
