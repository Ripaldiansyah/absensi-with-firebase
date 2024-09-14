
import 'package:flutter_bloc/flutter_bloc.dart';
import '../state/admin_response_sick_detail_state.dart';
import 'package:hyper_ui/bloc_util.dart';
import 'package:injectable/injectable.dart';

@singleton
class AdminResponseSickDetailController extends Cubit<AdminResponseSickDetailState> implements IBlocBase {
  AdminResponseSickDetailController() : super(AdminResponseSickDetailState());

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
    
      
    