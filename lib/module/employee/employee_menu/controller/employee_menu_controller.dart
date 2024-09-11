import 'package:flutter_bloc/flutter_bloc.dart';
import '../state/employee_menu_state.dart';
import 'package:hyper_ui/bloc_util.dart';
import 'package:injectable/injectable.dart';

@singleton
class EmployeeMenuController extends Cubit<EmployeeMenuState>
    implements IBlocBase {
  EmployeeMenuController() : super(EmployeeMenuState());

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
