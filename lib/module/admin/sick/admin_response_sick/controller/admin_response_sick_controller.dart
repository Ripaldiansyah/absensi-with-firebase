
import 'package:flutter_bloc/flutter_bloc.dart';
import '../state/admin_response_sick_state.dart';
import 'package:hyper_ui/bloc_util.dart';
import 'package:injectable/injectable.dart';

@singleton
class AdminResponseSickController extends Cubit<AdminResponseSickState> implements IBlocBase {
  AdminResponseSickController() : super(AdminResponseSickState());

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
    
      
    