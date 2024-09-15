import 'package:freezed_annotation/freezed_annotation.dart';
part 'admin_sick_list_by_user_state.freezed.dart';

@unfreezed
class AdminSickListByUserState with _$AdminSickListByUserState {
  factory AdminSickListByUserState({
    @Default(null) List? sicks,
  }) = _AdminSickListByUserState;
}
