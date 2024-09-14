import 'package:freezed_annotation/freezed_annotation.dart';
part 'admin_leaves_list_by_user_state.freezed.dart';

@unfreezed
class AdminLeavesListByUserState with _$AdminLeavesListByUserState {
  factory AdminLeavesListByUserState({
    @Default(null) List? leaves,
  }) = _AdminLeavesListByUserState;
}
