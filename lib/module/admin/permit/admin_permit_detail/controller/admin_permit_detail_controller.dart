import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import '../../../../../core.dart';
import '../state/admin_permit_detail_state.dart';
import 'package:hyper_ui/bloc_util.dart';
import 'package:injectable/injectable.dart';

@singleton
class AdminPermitDetailController extends Cubit<AdminPermitDetailState>
    implements IBlocBase {
  AdminPermitDetailController() : super(AdminPermitDetailState());

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

  responsePermit(Map<String, dynamic> response) async {
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
      await ResponsePermitService().approvalPermit(
          response["idResponse"], response["userIdEmployee"], responseData);
      await GetIt.I<AdminPermitApprovalController>().getRequestPermits();
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
