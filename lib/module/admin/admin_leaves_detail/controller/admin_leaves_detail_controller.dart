import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hyper_ui/core.dart';
import '../state/admin_leaves_detail_state.dart';
import 'package:hyper_ui/bloc_util.dart';
import 'package:injectable/injectable.dart';

@singleton
class AdminLeavesDetailController extends Cubit<AdminLeavesDetailState>
    implements IBlocBase {
  AdminLeavesDetailController() : super(AdminLeavesDetailState());

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

  responseLeave(Map<String, dynamic> response) async {
    final currentName = await UsersService().getCurrentName();
    try {
      Map<String, dynamic> responseData = {
        "idRequest": response["idRequest"],
        "message": response["message"],
        "operator": currentName,
        "responseDate": Timestamp.now(),
        "status": response["status"],
      };

      showLoading();
      await ResponseLeavesService().approvalLeave(
          response["idResponse"], response["userIdEmployee"], responseData);
      await GetIt.I<AdminLeavesApprovalController>().getRequestLeaves();
      await hideLoading();
      await Get.back();
      await Get.back();
      await Get.back();
      await ss("Cuti berhasil diperbarui");
    } catch (e) {
      print(e);
      // throw new Exception(e);
    }
  }
}
