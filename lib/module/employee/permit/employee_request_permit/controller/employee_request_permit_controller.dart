import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hyper_ui/service/request_permit_service.dart/request_permit_service.dart';
import '../../../../../core.dart';
import '../state/employee_request_permit_state.dart';
import 'package:hyper_ui/bloc_util.dart';
import 'package:injectable/injectable.dart';

@singleton
class EmployeeRequestPermitController extends Cubit<EmployeeRequestPermitState>
    implements IBlocBase {
  EmployeeRequestPermitController() : super(EmployeeRequestPermitState());

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

  getRequestPermits() async {
    try {
      final permits = await RequestPermitService().getPermitByCurrentUser();
      // Emit data ke state
      emit(state.copyWith(permits: permits));
      return permits;
    } catch (e) {
      se(e);
    }
  }

  searchPermits(String text) async {
    try {
      return await RequestPermitService().searchPermit(text);
    } catch (e) {
      se(e);
    }
  }

  Future<void> fetchRequestPermits() async {
    final fetchedPermits = await getRequestPermits();
    state.permits = fetchedPermits;
  }

  Future<void> fetchSearchRequestPermits(String text) async {
    final fetchedPermits = await searchPermits(text);
    state.permits = fetchedPermits;
    emit(state.copyWith(permits: state.permits));
  }
}
