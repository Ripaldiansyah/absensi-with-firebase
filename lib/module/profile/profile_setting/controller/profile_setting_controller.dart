import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hyper_ui/module/profile/profile_edit/view/profile_edit_view.dart';
import 'package:hyper_ui/service/auth_service/auth_service.dart';
import '../../../../core.dart';
import '../state/profile_setting_state.dart';
import 'package:hyper_ui/bloc_util.dart';
import 'package:injectable/injectable.dart';

@singleton
class ProfileSettingController extends Cubit<ProfileSettingState>
    implements IBlocBase {
  ProfileSettingController() : super(ProfileSettingState());

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

  logout() async {
    try {
      bool isLogged = await AuthService().logout();
      ss("Logout Sukses");
      Get.offAll(LoginView());
    } catch (e) {
      se("Kesalahan logout");
    }
  }

  emitData() {
    emit(state.copyWith());
  }

  editProfile() {
    Get.to(ProfileEditView());
  }
}
