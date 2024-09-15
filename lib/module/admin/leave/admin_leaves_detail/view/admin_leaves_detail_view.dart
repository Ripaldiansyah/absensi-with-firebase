import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hyper_ui/shared/widget/confirmation/confirmation.dart';
import '../../../../../core.dart';
import '../../../../../core_package.dart';
import '../controller/admin_leaves_detail_controller.dart';
import '../state/admin_leaves_detail_state.dart';
import 'package:get_it/get_it.dart';

class AdminLeavesDetailView extends StatefulWidget {
  final Map leave;
  const AdminLeavesDetailView({
    super.key,
    required this.leave,
  });

  @override
  State<AdminLeavesDetailView> createState() => _AdminLeavesDetailViewState();
}

class _AdminLeavesDetailViewState extends State<AdminLeavesDetailView> {
  AdminLeavesDetailController controller = AdminLeavesDetailController();

  @override
  void initState() {
    if (GetIt.I.isRegistered<AdminLeavesDetailController>()) {
      GetIt.I.unregister<AdminLeavesDetailController>();
    }
    GetIt.I.registerSingleton(controller);
    controller.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => controller.ready(),
    );
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => controller,
      child: BlocListener<AdminLeavesDetailController, AdminLeavesDetailState>(
        listener: (context, state) {},
        child: BlocBuilder<AdminLeavesDetailController, AdminLeavesDetailState>(
          builder: (context, state) {
            final bloc = context.read<AdminLeavesDetailController>();
            return buildView(context, bloc, state);
          },
        ),
      ),
    );
  }

  Widget buildView(
    BuildContext context,
    AdminLeavesDetailController controller,
    AdminLeavesDetailState state,
  ) {
    bool isDescriptionEmpty = widget.leave["description"] == "" ||
        widget.leave["description"] == null;
    String startLeave = DateFormat('EEEE, dd MMMM yyyy')
        .format(widget.leave["startLeave"].toDate());
    String endLeave = DateFormat('EEEE, dd MMMM yyyy')
        .format(widget.leave["endLeave"].toDate());
    String decisionDate = widget.leave["response"]["responseDate"] != null
        ? DateFormat('EEEE, dd MMMM yyyy')
            .format(widget.leave["response"]["responseDate"].toDate())
        : "-";

    result(Map<String, dynamic> confirmed, String status) async {
      if (confirmed["result"]) {
        Map<String, dynamic> response = {
          "idRequest": widget.leave["response"]["idRequest"],
          "message": confirmed["message"],
          "status": status,
          "idResponse": widget.leave["idResponse"],
          "userIdEmployee": widget.leave["userIdEmployee"],
        };

        await controller.responseLeave(response);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Info Cuti'),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${widget.leave["title"]}",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: secondaryTextColor,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Mulai Cuti",
                  style: TextStyle(fontSize: 15.0),
                ),
                Text(
                  "${startLeave}",
                  style: TextStyle(fontSize: 15.0),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Selesai Cuti",
                  style: TextStyle(fontSize: 15.0),
                ),
                Text(
                  "${endLeave}",
                  style: TextStyle(fontSize: 15.0),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    "Deskripsi",
                    style: TextStyle(fontSize: 15.0),
                  ),
                ),
                Text(
                  "${isDescriptionEmpty ? "-" : widget.leave["description"]}",
                  overflow: TextOverflow.fade,
                  textAlign:
                      isDescriptionEmpty ? TextAlign.right : TextAlign.justify,
                  style: TextStyle(fontSize: 15.0),
                ),
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
            Text(
              "Keputusan",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: secondaryTextColor,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Status",
                  style: TextStyle(fontSize: 15.0),
                ),
                Text(
                  "${widget.leave["response"]["status"]}",
                  style: TextStyle(fontSize: 15.0),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Pesan",
                  style: TextStyle(fontSize: 15.0),
                ),
                Text(
                  "${widget.leave["response"]["message"]}",
                  style: TextStyle(fontSize: 15.0),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Operator",
                  style: TextStyle(fontSize: 15.0),
                ),
                Text(
                  "${widget.leave["response"]["operator"]}",
                  style: TextStyle(fontSize: 15.0),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Modified date",
                  style: TextStyle(fontSize: 15.0),
                ),
                Text(
                  "${decisionDate}",
                  style: TextStyle(fontSize: 15.0),
                ),
              ],
            ),
            Expanded(
              child: Container(),
            ),
            if (widget.leave["response"]["status"] == "pending")
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  QButton(
                    label: "Approved",
                    color: primaryColor,
                    onPressed: () async {
                      Map<String, dynamic> confirmed = await Confirmation(
                              description: "Setujui Pengajuan cuti ?")
                          .showConfirmationDialog(context);
                      result(confirmed, "approved");
                    },
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  QButton(
                    label: "Rejected",
                    color: dangerColor,
                    onPressed: () async {
                      Map<String, dynamic> confirmed = await Confirmation(
                              description: "Tolak Pengajuan cuti ?")
                          .showConfirmationDialog(context);
                      result(confirmed, "rejected");
                    },
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
