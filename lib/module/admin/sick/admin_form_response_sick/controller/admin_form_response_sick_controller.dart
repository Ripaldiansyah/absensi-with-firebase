
import 'package:flutter_bloc/flutter_bloc.dart';
import '../state/admin_form_response_sick_state.dart';
import 'package:hyper_ui/bloc_util.dart';
import 'package:injectable/injectable.dart';

@singleton
class AdminFormResponseSickController extends Cubit<AdminFormResponseSickState> implements IBlocBase {
  AdminFormResponseSickController() : super(AdminFormResponseSickState());

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
    
      
    