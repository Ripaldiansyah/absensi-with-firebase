
import 'package:freezed_annotation/freezed_annotation.dart';
part 'admin_response_permit_state.freezed.dart';

@unfreezed
class AdminResponsePermitState with _$AdminResponsePermitState {
  factory AdminResponsePermitState({
    @Default(0) int counter,
  }) = _AdminResponsePermitState;
}
    
    