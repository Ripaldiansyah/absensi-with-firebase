import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hyper_ui/service/request_sick_service/request_sick_service.dart';
import '../../../../../core.dart';
import '../state/employee_request_sick_state.dart';
import 'package:hyper_ui/bloc_util.dart';
import 'package:injectable/injectable.dart';

@singleton
class EmployeeRequestSickController extends Cubit<EmployeeRequestSickState>
    implements IBlocBase {
  EmployeeRequestSickController() : super(EmployeeRequestSickState());

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

  getRequestSicks() async {
    try {
      final sicks = await RequestSickService().getSickByCurrentUser();
      // Emit data ke state
      emit(state.copyWith(sicks: sicks));
      return sicks;
    } catch (e) {
      se(e);
    }
  }

  searchSicks(String text) async {
    try {
      return await RequestSickService().searchSick(text);
    } catch (e) {
      se(e);
    }
  }

  Future<void> fetchRequestSicks() async {
    final fetchedSicks = await getRequestSicks();
    state.sicks = fetchedSicks;
  }

  Future<void> fetchSearchRequestSicks(String text) async {
    final fetchedSicks = await searchSicks(text);
    state.sicks = fetchedSicks;
    emit(state.copyWith(sicks: state.sicks));
  }
}
