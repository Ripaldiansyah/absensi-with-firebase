import 'package:freezed_annotation/freezed_annotation.dart';
part 'profile_edit_state.freezed.dart';

@unfreezed
class ProfileEditState with _$ProfileEditState {
  factory ProfileEditState({
    @Default(null) String? newEmail,
    @Default(null) String? newPhoneNumber,
  }) = _ProfileEditState;
}
