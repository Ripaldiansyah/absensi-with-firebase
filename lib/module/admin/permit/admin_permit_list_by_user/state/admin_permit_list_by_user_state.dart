import 'package:freezed_annotation/freezed_annotation.dart';
part 'admin_permit_list_by_user_state.freezed.dart';

@unfreezed
class AdminPermitListByUserState with _$AdminPermitListByUserState {
  factory AdminPermitListByUserState({
    @Default(null) List? permits,
  }) = _AdminPermitListByUserState;
}
