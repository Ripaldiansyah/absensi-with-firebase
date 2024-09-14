
import 'package:freezed_annotation/freezed_annotation.dart';
part 'employee_request_sick_detail_state.freezed.dart';

@unfreezed
class EmployeeRequestSickDetailState with _$EmployeeRequestSickDetailState {
  factory EmployeeRequestSickDetailState({
    @Default(0) int counter,
  }) = _EmployeeRequestSickDetailState;
}
    
    