
import 'package:freezed_annotation/freezed_annotation.dart';
part 'admin_main_navigation_state.freezed.dart';

@unfreezed
class AdminMainNavigationState with _$AdminMainNavigationState {
  factory AdminMainNavigationState({
    @Default(0) int counter,
  }) = _AdminMainNavigationState;
}
    
    