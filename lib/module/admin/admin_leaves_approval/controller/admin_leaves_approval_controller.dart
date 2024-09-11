import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hyper_ui/service/response_leaves_service/response_leaves_service.dart';
import 'package:hyper_ui/service/users_service/users_service.dart';
import '../../../../core.dart';
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
  void dispose() {
    //dispose event
  }

  @override
  void ready() {
    //ready event
  }

  Future<void> fetchRequestLeaves() async {
    final fetchedLeaves = await getRequestLeaves();
    state.leaves = fetchedLeaves;
  }

  // Future<void> fetchSearchRequestLeaves(String text) async {
  //   final fetchedLeaves = await searchLeaves(text);
  //   state.leaves = fetchedLeaves;
  // }

  getRequestLeaves() async {
    try {
      print(UsersService().getAllUser());

      // final leaves = await ResponseLeavesService().getLeaveByCurrentUser();
      // // Emit data ke state
      // emit(state.copyWith(leaves: leaves));
      // return leaves;
    } catch (e) {
      se(e);
    }
  }
}
