import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hyper_ui/core.dart';
import 'package:hyper_ui/service/auth_service/auth_service.dart';
import '../state/login_state.dart';
import 'package:hyper_ui/bloc_util.dart';
import 'package:injectable/injectable.dart';

@singleton
class LoginController extends Cubit<LoginState> implements IBlocBase {
  LoginController() : super(LoginState());

  @override
  void initState() {
    //initState event
  }

  @override
  void dispose() {
    //dispose event
  }

  @override
  void ready() {
    //ready event
  }
  login() async {
    try {
      bool isLogin = await AuthService().login(
        email: DBService.get("email") ?? state.email!,
        password: DBService.get("password") ?? state.password!,
      );
      ss("Login Sukses");

      Get.offAll(MainNavigationView());
    } catch (e) {
      se("Periksa kembali email dan password Anda");
      // print(e);
      // se(e);
    }
  }
}
