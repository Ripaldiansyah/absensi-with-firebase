import 'package:freezed_annotation/freezed_annotation.dart';
part 'employee_request_permit_detail_state.freezed.dart';

@unfreezed
class EmployeeRequestPermitDetailState with _$EmployeeRequestPermitDetailState {
  factory EmployeeRequestPermitDetailState({
    @Default(0) int counter,
  }) = _EmployeeRequestPermitDetailState;
}
