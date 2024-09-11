
import 'package:freezed_annotation/freezed_annotation.dart';
part 'employee_menu_state.freezed.dart';

@unfreezed
class EmployeeMenuState with _$EmployeeMenuState {
  factory EmployeeMenuState({
    @Default(0) int counter,
  }) = _EmployeeMenuState;
}
    
    