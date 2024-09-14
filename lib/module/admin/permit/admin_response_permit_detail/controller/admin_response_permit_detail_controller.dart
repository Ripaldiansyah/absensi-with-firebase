
import 'package:flutter_bloc/flutter_bloc.dart';
import '../state/admin_response_permit_detail_state.dart';
import 'package:hyper_ui/bloc_util.dart';
import 'package:injectable/injectable.dart';

@singleton
class AdminResponsePermitDetailController extends Cubit<AdminResponsePermitDetailState> implements IBlocBase {
  AdminResponsePermitDetailController() : super(AdminResponsePermitDetailState());

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
    
      
    