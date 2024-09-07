
import 'package:flutter_bloc/flutter_bloc.dart';
import '../state/admin_dashboard_state.dart';
import 'package:hyper_ui/bloc_util.dart';
import 'package:injectable/injectable.dart';

@singleton
class AdminDashboardController extends Cubit<AdminDashboardState> implements IBlocBase {
  AdminDashboardController() : super(AdminDashboardState());

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
    
      
    