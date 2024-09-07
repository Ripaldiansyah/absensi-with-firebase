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
        email: DBService.get("email")!,
        password: DBService.get("password")!,
      );
      ss("Login Sukses");

      if (isUser) {
        Get.offAll(EmployeeMainNavigationView());
      } else if (isAdmin) {
        Get.offAll(AdminMainNavigationView());
      }
    } catch (e) {
      se("Periksa kembali email dan password Anda");
    }
  }
}
