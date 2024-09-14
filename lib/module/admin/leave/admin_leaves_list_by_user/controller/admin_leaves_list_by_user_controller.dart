import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core.dart';
import '../state/admin_leaves_list_by_user_state.dart';
import 'package:hyper_ui/bloc_util.dart';
import 'package:injectable/injectable.dart';

@singleton
class AdminLeavesListByUserController extends Cubit<AdminLeavesListByUserState>
    implements IBlocBase {
  AdminLeavesListByUserController() : super(AdminLeavesListByUserState());

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

  emitData() {
    emit(state.copyWith());
  }

  getRequestLeaves(String userId) async {
    try {
      final leaves = await ResponseLeavesService().getLeaveByUser(userId);
      // Emit data ke state
      emit(state.copyWith(leaves: leaves));
      return leaves;
    } catch (e) {
      se(e);
    }
  }

  searchLeaves(String text, String userId) async {
    try {
      return await ResponseLeavesService().searchLeave(text, userId);
    } catch (e) {
      se(e);
    }
  }

  Future<void> fetchRequestLeaves(String userId) async {
    final fetchedLeaves = await getRequestLeaves(userId);
    state.leaves = fetchedLeaves;
  }

  Future<void> fetchSearchRequestLeaves(String text, String userId) async {
    final fetchedLeaves = await searchLeaves(text, userId);
    state.leaves = fetchedLeaves;
    emit(state.copyWith(leaves: state.leaves));
  }
}
