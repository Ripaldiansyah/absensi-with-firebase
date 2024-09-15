import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core.dart';
import '../state/admin_sick_list_by_user_state.dart';
import 'package:hyper_ui/bloc_util.dart';
import 'package:injectable/injectable.dart';

@singleton
class AdminSickListByUserController extends Cubit<AdminSickListByUserState>
    implements IBlocBase {
  AdminSickListByUserController() : super(AdminSickListByUserState());

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

  getRequestSicks(String userId) async {
    try {
      final sicks = await ResponseSickService().getSickByUser(userId);
      // Emit data ke state
      emit(state.copyWith(sicks: sicks));
      return sicks;
    } catch (e) {
      se(e);
    }
  }

  searchSicks(String text, String userId) async {
    try {
      return await ResponseSickService().searchSick(text, userId);
    } catch (e) {
      se(e);
    }
  }

  Future<void> fetchRequestSicks(String userId) async {
    final fetchedSick = await getRequestSicks(userId);
    state.sicks = fetchedSick;
  }

  Future<void> fetchSearchRequestSicks(String text, String userId) async {
    final fetchedSicks = await searchSicks(text, userId);
    state.sicks = fetchedSicks;
    emit(state.copyWith(sicks: state.sicks));
  }
}
