import 'package:freezed_annotation/freezed_annotation.dart';
part 'admin_list_user_qr_state.freezed.dart';

@unfreezed
class AdminListUserQrState with _$AdminListUserQrState {
  factory AdminListUserQrState({
    @Default(null) List? users,
  }) = _AdminListUserQrState;
}
