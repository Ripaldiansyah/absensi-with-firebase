import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core.dart';
import '../state/admin_sick_approval_state.dart';
import 'package:hyper_ui/bloc_util.dart';
import 'package:injectable/injectable.dart';

@singleton
class AdminSickApprovalController extends Cubit<AdminSickApprovalState>
    implements IBlocBase {
  AdminSickApprovalController() : super(AdminSickApprovalState());

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

  getRequestSicks() async {
    try {
      final users = await UsersService().getAllUsers();
      final userSicks = await ResponseSickService().getAllUserSick(users);
      if (!isClosed) {
        emit(state.copyWith(users: userSicks));
      }
    } catch (e) {
      print(e);
      se(e);
    }
  }

  searchUserSick(String text) async {
    try {
      final userSicks = await ResponseSickService().searchUserSick(text);
      if (!isClosed) {
        emit(state.copyWith(users: userSicks));
      }
    } catch (e) {
      print(e);
      se(e);
    }
  }
}
