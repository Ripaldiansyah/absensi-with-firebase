import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hyper_ui/core.dart';
import '../state/admin_presence_state.dart';
import 'package:hyper_ui/bloc_util.dart';
import 'package:injectable/injectable.dart';

@singleton
class AdminPresenceController extends Cubit<AdminPresenceState>
    implements IBlocBase {
  AdminPresenceController() : super(AdminPresenceState());

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

  void emitDataDateMonthYear(List<Map<String, dynamic>> dateMonthYear) {
    try {
      emit(state.copyWith(dateMonthYear: dateMonthYear));
    } catch (e) {
      print(e);
    }
  }

  getPresence(String monthYear, String dateMonthYear) async {
    try {
      final userPresence =
          await presenceService().getPresence(monthYear, dateMonthYear);
      if (!isClosed) {
        emit(state.copyWith(userPresence: userPresence));
      }
    } catch (e) {
      print(e);
    }
  }

  getDate(String monthYear) {
    return presenceService().getDate(monthYear);
  }
}
