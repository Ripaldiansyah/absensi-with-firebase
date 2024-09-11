import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hyper_ui/core.dart';
import 'package:hyper_ui/module/profile/profile_setting/controller/profile_setting_controller.dart';
import 'package:hyper_ui/module/profile/profile_setting/view/profile_setting_view.dart';
import 'package:hyper_ui/service/auth_service/auth_service.dart';
import 'package:hyper_ui/service/profile_service/profile_service.dart';
import '../state/profile_edit_state.dart';
import 'package:hyper_ui/bloc_util.dart';
import 'package:injectable/injectable.dart';

@singleton
class ProfileEditController extends Cubit<ProfileEditState>
    implements IBlocBase {
  ProfileEditController() : super(ProfileEditState());

  @override
  void initState() {
    //initState event
  }

  @override
  void dispose() {
    //dispose event
  }

  @override
  void ready() {}

  editProfile() async {
    try {
      showLoading();
      bool isEdited = await ProfileService().editProfile(
        currentEmail: DBService.get("email")!,
        password: DBService.get("password")!,
        newEmail: state.newEmail!,
        newPhoneNumber: state.newPhoneNumber!,
        token: DBService.get("token")!,
      );
      Widget mainView = MainNavigationView();
      if (isEdited) {
        ss("Perubahan sukses");
        DBService.set("email", state.newEmail!);
        DBService.set("phoneNumber", state.newPhoneNumber!);
      }
      await hideLoading();
      await Get.back();
      await GetIt.I<ProfileSettingController>().emitData();
    } catch (e) {
      se(e);
      hideLoading();
    }
  }
}
