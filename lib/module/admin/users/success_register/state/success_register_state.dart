
import 'package:freezed_annotation/freezed_annotation.dart';
part 'success_register_state.freezed.dart';

@unfreezed
class SuccessRegisterState with _$SuccessRegisterState {
  factory SuccessRegisterState({
    @Default(0) int counter,
  }) = _SuccessRegisterState;
}
    
    