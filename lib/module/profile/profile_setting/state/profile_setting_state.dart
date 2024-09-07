
import 'package:freezed_annotation/freezed_annotation.dart';
part 'profile_setting_state.freezed.dart';

@unfreezed
class ProfileSettingState with _$ProfileSettingState {
  factory ProfileSettingState({
    @Default(0) int counter,
  }) = _ProfileSettingState;
}
    
    