
import 'package:flutter_bloc/flutter_bloc.dart';
import '../state/admin_main_navigation_state.dart';
import 'package:hyper_ui/bloc_util.dart';
import 'package:injectable/injectable.dart';

@singleton
class AdminMainNavigationController extends Cubit<AdminMainNavigationState> implements IBlocBase {
  AdminMainNavigationController() : super(AdminMainNavigationState());

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
    
      
    