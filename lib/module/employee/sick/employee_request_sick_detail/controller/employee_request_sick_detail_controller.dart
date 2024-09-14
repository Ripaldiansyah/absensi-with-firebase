import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hyper_ui/service/request_sick_service/request_sick_service.dart';
import '../../../../../core.dart';
import '../state/employee_request_sick_detail_state.dart';
import 'package:hyper_ui/bloc_util.dart';
import 'package:injectable/injectable.dart';

@singleton
class EmployeeRequestSickDetailController
    extends Cubit<EmployeeRequestSickDetailState> implements IBlocBase {
  EmployeeRequestSickDetailController()
      : super(EmployeeRequestSickDetailState());

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

  deleteSick(Map<dynamic, dynamic> sick) async {
    try {
      showLoading();
      await RequestSickService()
          .deleteSickRequest(sick["idResponse"], sick["response"]["idRequest"]);
      await GetIt.I<EmployeeRequestSickController>().fetchRequestSicks();
      await hideLoading();
      await Get.back();
      await ss("Permintaan berhasil dihapus");
    } catch (e) {
      print(e);
    }
  }
}
