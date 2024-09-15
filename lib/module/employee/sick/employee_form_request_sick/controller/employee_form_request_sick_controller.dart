import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hyper_ui/service/request_sick_service/request_sick_service.dart';
import '../../../../../core.dart';
import '../state/employee_form_request_sick_state.dart';
import 'package:hyper_ui/bloc_util.dart';
import 'package:injectable/injectable.dart';

@singleton
class EmployeeFormRequestSickController
    extends Cubit<EmployeeFormRequestSickState> implements IBlocBase {
  EmployeeFormRequestSickController() : super(EmployeeFormRequestSickState());

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

  createSick() async {
    try {
      Map<String, dynamic> sickData = {
        "title": state.title,
        "requestDate": Timestamp.now(),
        "startDate": state.startDate,
        "endDate": state.endDate,
        "docUrl": state.docUrl,
        "description": state.description == null ? "-" : state.description,
      };
      showLoading();
      await RequestSickService().insertSickRequest(sickData);
      await GetIt.I<EmployeeRequestSickController>().fetchRequestSicks();
      await hideLoading();
      await Get.back();
      await ss("Permintaan berhasil diajukan");
    } catch (e) {}
  }

  updateSick(Map<dynamic, dynamic> sick) async {
    bool isTitleUpdate = state.title != null ? true : false;
    bool isStartDateUpdate = state.startDate != null ? true : false;
    bool isEndDateUpdate = state.endDate != null ? true : false;
    bool isDescriptionUpdate = state.description != null ? true : false;

    try {
      Map<String, dynamic> sickData = {
        "title": isTitleUpdate ? state.title : sick["title"],
        "requestDate": sick["requestDate"],
        "startDate": isStartDateUpdate ? state.startDate : sick["StartDate"],
        "endDate": isEndDateUpdate ? state.endDate : sick["endDate"],
        "description":
            isDescriptionUpdate ? state.description : sick["description"],
      };

      showLoading();
      await RequestSickService()
          .updateSickRequest(sick["response"]["idRequest"], sickData);
      await GetIt.I<EmployeeRequestSickController>().fetchRequestSicks();
      await hideLoading();
      await Get.back();
      await Get.back();
      await ss("Permintaan berhasil diperbarui");
    } catch (e) {
      print(e);
      // throw new Exception(e);
    }
  }
}
