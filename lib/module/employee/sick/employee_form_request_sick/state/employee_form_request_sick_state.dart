import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'employee_form_request_sick_state.freezed.dart';

@unfreezed
class EmployeeFormRequestSickState with _$EmployeeFormRequestSickState {
  factory EmployeeFormRequestSickState({
    @Default(null) String? title,
    @Default(null) DateTime? startDate,
    @Default(null) DateTime? endDate,
    @Default(null) String? description,
    @Default(null) String? docUrl,
  }) = _EmployeeFormRequestSickState;
}
