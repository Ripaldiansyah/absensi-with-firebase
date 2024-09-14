
import 'package:flutter_bloc/flutter_bloc.dart';
import '../state/admin_response_permit_state.dart';
import 'package:hyper_ui/bloc_util.dart';
import 'package:injectable/injectable.dart';

@singleton
class AdminResponsePermitController extends Cubit<AdminResponsePermitState> implements IBlocBase {
  AdminResponsePermitController() : super(AdminResponsePermitState());

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

  increment() {
    state.counter++;
    emit(state.copyWith());
  }
}
    
      
    