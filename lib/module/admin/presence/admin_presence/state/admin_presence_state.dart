import 'package:freezed_annotation/freezed_annotation.dart';
part 'admin_presence_state.freezed.dart';

@unfreezed
class AdminPresenceState with _$AdminPresenceState {
  factory AdminPresenceState({
    @Default(null) List? userPresence,
    @Default(null) List<Map<String, dynamic>>? dateMonthYear,
  }) = _AdminPresenceState;
}
