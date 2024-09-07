import 'package:freezed_annotation/freezed_annotation.dart';
part 'login_state.freezed.dart';

@unfreezed
class LoginState with _$LoginState {
  factory LoginState({
    @Default(null) String? email,
    @Default(null) String? password,
  }) = _LoginState;
}
