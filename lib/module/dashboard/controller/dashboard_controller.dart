import 'package:flutter_bloc/flutter_bloc.dart';
import '../state/dashboard_state.dart';
import 'package:hyper_ui/bloc_util.dart';
import 'package:injectable/injectable.dart';

@singleton
class DashboardController extends Cubit<DashboardState> implements IBlocBase {
  DashboardController() : super(DashboardState());

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
}
