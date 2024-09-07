
import 'package:freezed_annotation/freezed_annotation.dart';
part 'admin_dashboard_state.freezed.dart';

@unfreezed
class AdminDashboardState with _$AdminDashboardState {
  factory AdminDashboardState({
    @Default(0) int counter,
  }) = _AdminDashboardState;
}
    
    