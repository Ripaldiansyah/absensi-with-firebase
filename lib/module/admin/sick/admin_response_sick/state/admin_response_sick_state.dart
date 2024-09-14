
import 'package:freezed_annotation/freezed_annotation.dart';
part 'admin_response_sick_state.freezed.dart';

@unfreezed
class AdminResponseSickState with _$AdminResponseSickState {
  factory AdminResponseSickState({
    @Default(0) int counter,
  }) = _AdminResponseSickState;
}
    
    