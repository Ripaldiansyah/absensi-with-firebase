import 'package:freezed_annotation/freezed_annotation.dart';
part 'admin_leaves_approval_state.freezed.dart';

@unfreezed
class AdminLeavesApprovalState with _$AdminLeavesApprovalState {
  factory AdminLeavesApprovalState({
    @Default(null) List? users,
  }) = _AdminLeavesApprovalState;
}
