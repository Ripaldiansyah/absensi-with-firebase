import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import '../../../../core.dart';
import '../state/employee_request_leave_detail_state.dart';
import 'package:hyper_ui/bloc_util.dart';
import 'package:injectable/injectable.dart';

@singleton
class EmployeeRequestLeaveDetailController
    extends Cubit<EmployeeRequestLeaveDetailState> implements IBlocBase {
  EmployeeRequestLeaveDetailController()
      : super(EmployeeRequestLeaveDetailState());

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

  deleteLeave(Map<dynamic, dynamic> leave) async {
    try {
      showLoading();
      await RequestLeaveService().deleteLeaveRequest(
          leave["idResponse"], leave["response"]["idRequest"]);
      await GetIt.I<EmployeeRequestLeaveController>().fetchRequestLeaves();
      await hideLoading();
      await Get.back();
      await ss("Cuti berhasil dihapus");
    } catch (e) {
      print(e);
    }
  }
}
