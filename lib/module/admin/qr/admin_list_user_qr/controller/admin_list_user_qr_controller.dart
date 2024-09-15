import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core.dart';
import '../state/admin_list_user_qr_state.dart';
import 'package:hyper_ui/bloc_util.dart';
import 'package:injectable/injectable.dart';

@singleton
class AdminListUserQrController extends Cubit<AdminListUserQrState>
    implements IBlocBase {
  AdminListUserQrController() : super(AdminListUserQrState());

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
  getUser() async {
    try {
      final users = await UsersService().getAllUsers();
      if (!isClosed) {
        emit(state.copyWith(users: users));
      }
    } catch (e) {
      print(e);
      se(e);
    }
  }

  searchUser(String text) async {
    try {
      final users = await UsersService().searchUser(text);
      if (!isClosed) {
        emit(state.copyWith(users: users));
      }
    } catch (e) {
      print(e);
      se(e);
    }
  }
}
