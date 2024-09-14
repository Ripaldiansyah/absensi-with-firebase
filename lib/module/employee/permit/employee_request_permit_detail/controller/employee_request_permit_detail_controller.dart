import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hyper_ui/service/request_permit_service.dart/request_permit_service.dart';
import '../../../../../core.dart';
import '../state/employee_request_permit_detail_state.dart';
import 'package:hyper_ui/bloc_util.dart';
import 'package:injectable/injectable.dart';

@singleton
class EmployeeRequestPermitDetailController
    extends Cubit<EmployeeRequestPermitDetailState> implements IBlocBase {
  EmployeeRequestPermitDetailController()
      : super(EmployeeRequestPermitDetailState());

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

  deletePermit(Map<dynamic, dynamic> permit) async {
    try {
      showLoading();
      await RequestPermitService().deletePermitRequest(
          permit["idResponse"], permit["response"]["idRequest"]);
      await GetIt.I<EmployeeRequestPermitController>().fetchRequestPermits();
      await hideLoading();
      await Get.back();
      await ss("Izin berhasil dihapus");
    } catch (e) {
      print(e);
    }
  }
}
