import 'package:freezed_annotation/freezed_annotation.dart';
part 'employee_request_permit_state.freezed.dart';

@unfreezed
class EmployeeRequestPermitState with _$EmployeeRequestPermitState {
  factory EmployeeRequestPermitState({
    @Default(null) List? permits,
  }) = _EmployeeRequestPermitState;
}
