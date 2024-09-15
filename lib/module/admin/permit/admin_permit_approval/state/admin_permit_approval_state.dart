import 'package:freezed_annotation/freezed_annotation.dart';
part 'admin_permit_approval_state.freezed.dart';

@unfreezed
class AdminPermitApprovalState with _$AdminPermitApprovalState {
  factory AdminPermitApprovalState({
    @Default(null) List? users,
  }) = _AdminPermitApprovalState;
}
