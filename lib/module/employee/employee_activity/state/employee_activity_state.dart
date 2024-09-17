import 'package:freezed_annotation/freezed_annotation.dart';
part 'employee_activity_state.freezed.dart';

@unfreezed
class EmployeeActivityState with _$EmployeeActivityState {
  factory EmployeeActivityState({
    @Default(null) List? history,
  }) = _EmployeeActivityState;
}
