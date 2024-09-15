import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core.dart';
import '../state/admin_permit_approval_state.dart';
import 'package:hyper_ui/bloc_util.dart';
import 'package:injectable/injectable.dart';

@singleton
class AdminPermitApprovalController extends Cubit<AdminPermitApprovalState>
    implements IBlocBase {
  AdminPermitApprovalController() : super(AdminPermitApprovalState());

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

  getRequestPermits() async {
    try {
      final users = await UsersService().getAllUsers();
      final userPermits = await ResponsePermitService().getAllUserPermit(users);
      if (!isClosed) {
        emit(state.copyWith(users: userPermits));
      }
    } catch (e) {
      print(e);
      se(e);
    }
  }

  searchUserPermit(String text) async {
    try {
      final userPermits = await ResponsePermitService().searchUserPermit(text);
      if (!isClosed) {
        emit(state.copyWith(users: userPermits));
      }
    } catch (e) {
      print(e);
      se(e);
    }
  }
}
