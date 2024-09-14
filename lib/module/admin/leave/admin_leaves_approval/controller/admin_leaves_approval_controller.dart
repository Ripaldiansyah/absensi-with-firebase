import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hyper_ui/service/response_leaves_service/response_leaves_service.dart';
import 'package:hyper_ui/service/users_service/users_service.dart';
import '../../../../../core.dart';
import '../state/admin_leaves_approval_state.dart';
import 'package:hyper_ui/bloc_util.dart';
import 'package:injectable/injectable.dart';

@singleton
class AdminLeavesApprovalController extends Cubit<AdminLeavesApprovalState>
    implements IBlocBase {
  AdminLeavesApprovalController() : super(AdminLeavesApprovalState());

  @override
  void initState() {
    //initState event
  }

  @override
  void dispose() {}

  @override
  void ready() {
    //ready event
  }

  getRequestLeaves() async {
    try {
      final users = await UsersService().getAllUsers();
      final userLeaves = await ResponseLeavesService().getAllUserLeave(users);
      if (!isClosed) {
        emit(state.copyWith(users: userLeaves));
      }
    } catch (e) {
      print(e);
      se(e);
    }
  }

  searchUserLeave(String text) async {
    try {
      final userLeaves = await ResponseLeavesService().searchUserLeave(text);
      if (!isClosed) {
        emit(state.copyWith(users: userLeaves));
      }
    } catch (e) {
      print(e);
      se(e);
    }
  }
}
