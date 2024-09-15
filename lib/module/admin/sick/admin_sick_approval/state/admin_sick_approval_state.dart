import 'package:freezed_annotation/freezed_annotation.dart';
part 'admin_sick_approval_state.freezed.dart';

@unfreezed
class AdminSickApprovalState with _$AdminSickApprovalState {
  factory AdminSickApprovalState({
    @Default(null) List? users,
  }) = _AdminSickApprovalState;
}
