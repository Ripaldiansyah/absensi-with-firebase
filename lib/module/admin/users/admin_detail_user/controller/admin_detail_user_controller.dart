import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import '../../../../../core.dart';
import '../state/admin_detail_user_state.dart';
import 'package:hyper_ui/bloc_util.dart';
import 'package:injectable/injectable.dart';

@singleton
class AdminDetailUserController extends Cubit<AdminDetailUserState>
    implements IBlocBase {
  AdminDetailUserController() : super(AdminDetailUserState());

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

  deleteAccount(Map<String, dynamic> deleteData) async {
    try {
      showLoading();
      final deleted = await AuthService().deleteAccount(deleteData);
      await GetIt.I<AdminListUserController>().getUser();
      await hideLoading();
      return await deleted;
    } catch (e) {
      throw new Exception(e);
    }
  }
}
