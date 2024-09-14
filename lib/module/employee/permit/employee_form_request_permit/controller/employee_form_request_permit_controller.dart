import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hyper_ui/service/request_permit_service.dart/request_permit_service.dart';
import '../../../../../core.dart';
import '../state/employee_form_request_permit_state.dart';
import 'package:hyper_ui/bloc_util.dart';
import 'package:injectable/injectable.dart';

@singleton
class EmployeeFormRequestPermitController
    extends Cubit<EmployeeFormRequestPermitState> implements IBlocBase {
  EmployeeFormRequestPermitController()
      : super(EmployeeFormRequestPermitState());

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

  createPermit() async {
    try {
      Map<String, dynamic> permitData = {
        "title": state.title,
        "requestDate": Timestamp.now(),
        "permitDate": state.permitDate,
        "description": state.description == null ? "-" : state.description,
      };
      showLoading();
      await RequestPermitService().insertPermitRequest(permitData);
      await GetIt.I<EmployeeRequestPermitController>().fetchRequestPermits();
      await hideLoading();
      await Get.back();
      await ss("Izin berhasil diajukan");
    } catch (e) {}
  }

  updatePermit(Map<dynamic, dynamic> permit) async {
    bool isTitleUpdate = state.title != null ? true : false;
    bool isPermitDateUpdate = state.permitDate != null ? true : false;
    bool isDescriptionUpdate = state.description != null ? true : false;

    try {
      Map<String, dynamic> permitData = {
        "title": isTitleUpdate ? state.title : permit["title"],
        "requestDate": permit["requestDate"],
        "permitDate":
            isPermitDateUpdate ? state.permitDate : permit["permitDate"],
        "description":
            isDescriptionUpdate ? state.description : permit["description"],
      };

      showLoading();
      await RequestPermitService()
          .updatePermitRequest(permit["response"]["idRequest"], permitData);
      await GetIt.I<EmployeeRequestPermitController>().fetchRequestPermits();
      await hideLoading();
      await Get.back();
      await Get.back();
      await ss("Izin berhasil diperbarui");
    } catch (e) {
      print(e);
      // throw new Exception(e);
    }
  }
}
