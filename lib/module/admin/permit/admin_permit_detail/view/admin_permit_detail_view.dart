import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core.dart';
import '../controller/admin_permit_detail_controller.dart';
import '../state/admin_permit_detail_state.dart';
import 'package:get_it/get_it.dart';

class AdminPermitDetailView extends StatefulWidget {
  final Map permit;
  const AdminPermitDetailView({
    super.key,
    required this.permit,
  });

  @override
  State<AdminPermitDetailView> createState() => _AdminPermitDetailViewState();
}

class _AdminPermitDetailViewState extends State<AdminPermitDetailView> {
  AdminPermitDetailController controller = AdminPermitDetailController();

  @override
  void initState() {
    if (GetIt.I.isRegistered<AdminPermitDetailController>()) {
      GetIt.I.unregister<AdminPermitDetailController>();
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
      child: BlocListener<AdminPermitDetailController, AdminPermitDetailState>(
        listener: (context, state) {},
        child: BlocBuilder<AdminPermitDetailController, AdminPermitDetailState>(
          builder: (context, state) {
            final bloc = context.read<AdminPermitDetailController>();
            return buildView(context, bloc, state);
          },
        ),
      ),
    );
  }

  Widget buildView(
    BuildContext context,
    AdminPermitDetailController controller,
    AdminPermitDetailState state,
  ) {
    bool isDescriptionEmpty = widget.permit["description"] == "" ||
        widget.permit["description"] == null;
    String permitDate = DateFormat('EEEE, dd MMMM yyyy')
        .format(widget.permit["permitDate"].toDate());
    String decisionDate = widget.permit["response"]["responseDate"] != null
        ? DateFormat('EEEE, dd MMMM yyyy')
            .format(widget.permit["response"]["responseDate"].toDate())
        : "-";

    result(Map<String, dynamic> confirmed, String status) async {
      if (confirmed["result"]) {
        Map<String, dynamic> response = {
          "idRequest": widget.permit["response"]["idRequest"],
          "message": confirmed["message"],
          "status": status,
          "idResponse": widget.permit["idResponse"],
          "userIdEmployee": widget.permit["userIdEmployee"],
        };

        await controller.responsePermit(response);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Info Izin'),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${widget.permit["title"]}",
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
                  "Tanggal Izin",
                  style: TextStyle(fontSize: 15.0),
                ),
                Text(
                  "${permitDate}",
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
                  "${isDescriptionEmpty ? "-" : widget.permit["description"]}",
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
                  "${widget.permit["response"]["status"]}",
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
                  "${widget.permit["response"]["message"]}",
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
                  "${widget.permit["response"]["operator"]}",
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
            if (widget.permit["response"]["status"] == "pending")
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  QButton(
                    label: "Approved",
                    color: primaryColor,
                    onPressed: () async {
                      Map<String, dynamic> confirmed = await Confirmation(
                              description: "Setujui Pengajuan Izin ?")
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
                              description: "Tolak Pengajuan Izin ?")
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
