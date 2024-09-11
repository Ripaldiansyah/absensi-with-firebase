import 'package:freezed_annotation/freezed_annotation.dart';
part 'main_navigation_state.freezed.dart';

@unfreezed
class MainNavigationState with _$MainNavigationState {
  factory MainNavigationState({
    @Default(0) int counter,
  }) = _MainNavigationState;
}
