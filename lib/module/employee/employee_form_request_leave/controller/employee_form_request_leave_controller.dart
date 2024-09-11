import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hyper_ui/core.dart';
import '../state/employee_form_request_leave_state.dart';
import 'package:hyper_ui/bloc_util.dart';
import 'package:injectable/injectable.dart';

@singleton
class EmployeeFormRequestLeaveController
    extends Cubit<EmployeeFormRequestLeaveState> implements IBlocBase {
  EmployeeFormRequestLeaveController() : super(EmployeeFormRequestLeaveState());

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

  createLeave() async {
    try {
      Map<String, dynamic> leaveData = {
        "title": state.title,
        "requestDate": Timestamp.now(),
        "startLeave": state.startLeave,
        "endLeave": state.endLeave,
        "description": state.description == null ? "-" : state.description,
      };
      showLoading();
      await RequestLeaveService().insertLeaveRequest(leaveData);
      await GetIt.I<EmployeeRequestLeaveController>().fetchRequestLeaves();
      await hideLoading();
      await Get.back();
      await ss("Cuti berhasil diajukan");
    } catch (e) {}
  }

  updateLeave(Map<dynamic, dynamic> leave) async {
    bool isTitleUpdate = state.title != null ? true : false;
    bool isStartLeaveUpdate = state.startLeave != null ? true : false;
    bool isEndLeaveUpdate = state.endLeave != null ? true : false;
    bool isDescriptionUpdate = state.description != null ? true : false;

    try {
      Map<String, dynamic> leaveData = {
        "title": isTitleUpdate ? state.title : leave["title"],
        "requestDate": leave["requestDate"],
        "startLeave":
            isStartLeaveUpdate ? state.startLeave : leave["startLeave"],
        "endLeave": isEndLeaveUpdate ? state.endLeave : leave["endLeave"],
        "description":
            isDescriptionUpdate ? state.description : leave["description"],
      };

      showLoading();
      await RequestLeaveService()
          .updateLeaveRequest(leave["response"]["idRequest"], leaveData);
      await GetIt.I<EmployeeRequestLeaveController>().fetchRequestLeaves();
      await hideLoading();
      await Get.back();
      await Get.back();
      await ss("Cuti berhasil diperbarui");
    } catch (e) {
      print(e);
      // throw new Exception(e);
    }
  }
}
