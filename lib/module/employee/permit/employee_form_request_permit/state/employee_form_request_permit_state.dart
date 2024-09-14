import 'package:freezed_annotation/freezed_annotation.dart';
part 'employee_form_request_permit_state.freezed.dart';

@unfreezed
class EmployeeFormRequestPermitState with _$EmployeeFormRequestPermitState {
  factory EmployeeFormRequestPermitState({
    @Default(null) String? title,
    @Default(null) DateTime? permitDate,
    @Default(null) String? description,
  }) = _EmployeeFormRequestPermitState;
}
