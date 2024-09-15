import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core.dart';
import '../state/admin_permit_list_by_user_state.dart';
import 'package:hyper_ui/bloc_util.dart';
import 'package:injectable/injectable.dart';

@singleton
class AdminPermitListByUserController extends Cubit<AdminPermitListByUserState>
    implements IBlocBase {
  AdminPermitListByUserController() : super(AdminPermitListByUserState());

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

  getRequestPermits(String userId) async {
    try {
      final permits = await ResponsePermitService().getPermitByUser(userId);
      // Emit data ke state
      emit(state.copyWith(permits: permits));
      return permits;
    } catch (e) {
      se(e);
    }
  }

  searchPermits(String text, String userId) async {
    try {
      return await ResponsePermitService().searchPermit(text, userId);
    } catch (e) {
      se(e);
    }
  }

  Future<void> fetchRequestPermits(String userId) async {
    final fetchedPermit = await getRequestPermits(userId);
    state.permits = fetchedPermit;
  }

  Future<void> fetchSearchRequestPermits(String text, String userId) async {
    final fetchedPermits = await searchPermits(text, userId);
    state.permits = fetchedPermits;
    emit(state.copyWith(permits: state.permits));
  }
}
