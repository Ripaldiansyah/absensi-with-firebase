
import 'package:flutter_bloc/flutter_bloc.dart';
import '../state/admin_form_response_permit_state.dart';
import 'package:hyper_ui/bloc_util.dart';
import 'package:injectable/injectable.dart';

@singleton
class AdminFormResponsePermitController extends Cubit<AdminFormResponsePermitState> implements IBlocBase {
  AdminFormResponsePermitController() : super(AdminFormResponsePermitState());

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
    
      
    