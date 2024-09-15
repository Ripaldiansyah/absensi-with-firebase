
import 'package:freezed_annotation/freezed_annotation.dart';
part 'admin_detail_user_state.freezed.dart';

@unfreezed
class AdminDetailUserState with _$AdminDetailUserState {
  factory AdminDetailUserState({
    @Default(0) int counter,
  }) = _AdminDetailUserState;
}
    
    