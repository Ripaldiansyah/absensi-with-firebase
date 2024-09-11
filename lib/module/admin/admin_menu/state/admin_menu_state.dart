
import 'package:freezed_annotation/freezed_annotation.dart';
part 'admin_menu_state.freezed.dart';

@unfreezed
class AdminMenuState with _$AdminMenuState {
  factory AdminMenuState({
    @Default(0) int counter,
  }) = _AdminMenuState;
}
    
    