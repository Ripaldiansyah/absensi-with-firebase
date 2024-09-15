import 'package:freezed_annotation/freezed_annotation.dart';
part 'admin_form_user_state.freezed.dart';

@unfreezed
class AdminFormUserState with _$AdminFormUserState {
  factory AdminFormUserState({
    @Default(null) String? email,
    @Default(null) String? password,
    @Default(null) String? passwordConfirm,
    @Default(null) String? phoneNumber,
    @Default(null) String? role,
    @Default(null) String? idEmployee,
    @Default(null) String? name,
  }) = _AdminFormUserState;
}
