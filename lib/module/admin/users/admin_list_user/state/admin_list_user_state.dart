import 'package:freezed_annotation/freezed_annotation.dart';
part 'admin_list_user_state.freezed.dart';

@unfreezed
class AdminListUserState with _$AdminListUserState {
  factory AdminListUserState({
    @Default(null) List? users,
  }) = _AdminListUserState;
}
