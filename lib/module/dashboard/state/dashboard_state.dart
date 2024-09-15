import 'package:freezed_annotation/freezed_annotation.dart';
part 'dashboard_state.freezed.dart';

@unfreezed
class DashboardState with _$DashboardState {
  factory DashboardState({
    @Default(null) Map<String, dynamic>? attendance,
  }) = _DashboardState;
}
