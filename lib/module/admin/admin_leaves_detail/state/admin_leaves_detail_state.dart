import 'package:freezed_annotation/freezed_annotation.dart';
part 'admin_leaves_detail_state.freezed.dart';

@unfreezed
class AdminLeavesDetailState with _$AdminLeavesDetailState {
  factory AdminLeavesDetailState({
    @Default(null) Map<String, dynamic>? response,
  }) = _AdminLeavesDetailState;
}
