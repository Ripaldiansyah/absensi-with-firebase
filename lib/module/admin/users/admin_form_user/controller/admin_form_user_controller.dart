import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hyper_ui/core.dart';
import 'package:min_id/min_id.dart';
import '../state/admin_form_user_state.dart';
import 'package:hyper_ui/bloc_util.dart';
import 'package:injectable/injectable.dart';

@singleton
class AdminFormUserController extends Cubit<AdminFormUserState>
    implements IBlocBase {
  AdminFormUserController() : super(AdminFormUserState());

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

  register() async {
    try {
      final id = MinId.getId('SMP{5{d}}-{3{d}}');
      Map<String, dynamic> userData = {
        "email": state.email,
        "password": state.password,
        "name": state.name,
        "role": state.role,
        "phoneNumber": state.phoneNumber,
        "idEmployee": id,
      };
      showLoading();
      final registered = await AuthService().registerUser(userData);
      await GetIt.I<AdminListUserController>().getUser();
      await hideLoading();
      return await registered;
    } catch (e) {
      throw new Exception(e);
    }
  }

  updateUser(Map<String, dynamic> updateData) async {
    try {
      Map<String, dynamic> userData = {
        "name": updateData["name"],
        "role": updateData["role"],
        "phoneNumber": updateData["phoneNumber"],
        "userId": updateData["userId"],
      };
      showLoading();
      final updated = await AuthService().updateProfile(userData);
      await GetIt.I<AdminListUserController>().getUser();
      await hideLoading();
      return await updated;
    } catch (e) {
      throw new Exception(e);
    }
  }
}
