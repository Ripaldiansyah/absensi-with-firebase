import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core.dart';
import '../controller/admin_sick_detail_controller.dart';
import '../state/admin_sick_detail_state.dart';
import 'package:get_it/get_it.dart';

class AdminSickDetailView extends StatefulWidget {
  final Map sick;
  const AdminSickDetailView({
    super.key,
    required this.sick,
  });

  @override
  State<AdminSickDetailView> createState() => _AdminSickDetailViewState();
}

class _AdminSickDetailViewState extends State<AdminSickDetailView> {
  AdminSickDetailController controller = AdminSickDetailController();

  @override
  void initState() {
    if (GetIt.I.isRegistered<AdminSickDetailController>()) {
      GetIt.I.unregister<AdminSickDetailController>();
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
      child: BlocListener<AdminSickDetailController, AdminSickDetailState>(
        listener: (context, state) {},
        child: BlocBuilder<AdminSickDetailController, AdminSickDetailState>(
          builder: (context, state) {
            final bloc = context.read<AdminSickDetailController>();
            return buildView(context, bloc, state);
          },
        ),
      ),
    );
  }

  Widget buildView(
    BuildContext context,
    AdminSickDetailController controller,
    AdminSickDetailState state,
  ) {
    bool isDescriptionEmpty =
        widget.sick["description"] == "" || widget.sick["description"] == null;
    String startSick = DateFormat('EEEE, dd MMMM yyyy')
        .format(widget.sick["startDate"].toDate());
    String endSick = DateFormat('EEEE, dd MMMM yyyy')
        .format(widget.sick["endDate"].toDate());
    String decisionDate = widget.sick["response"]["responseDate"] != null
        ? DateFormat('EEEE, dd MMMM yyyy')
            .format(widget.sick["response"]["responseDate"].toDate())
        : "-";

    result(Map<String, dynamic> confirmed, String status) async {
      if (confirmed["result"]) {
        Map<String, dynamic> response = {
          "idRequest": widget.sick["response"]["idRequest"],
          "message": confirmed["message"],
          "status": status,
          "idResponse": widget.sick["idResponse"],
          "userIdEmployee": widget.sick["userIdEmployee"],
        };

        await controller.responseSick(response);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Info Sakit'),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${widget.sick["title"]}",
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
                  "Mulai Sakit",
                  style: TextStyle(fontSize: 15.0),
                ),
                Text(
                  "${startSick}",
                  style: TextStyle(fontSize: 15.0),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Perkiraan Sembuh",
                  style: TextStyle(fontSize: 15.0),
                ),
                Text(
                  "${endSick}",
                  style: TextStyle(fontSize: 15.0),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Surat Sakit",
                  style: TextStyle(fontSize: 15.0),
                ),
                Image.network(
                  "${widget.sick["docUrl"]}",
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 4,
                  fit: BoxFit.fill,
                ),
                GestureDetector(
                  // Menggunakan GestureDetector untuk mendeteksi ketukan
                  onTap: () {
                    launchUrl(Uri.parse(
                        widget.sick["docUrl"])); // Membuka URL di browser
                  },
                  child: Text(
                    "Buka Gambar di browser",
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors
                          .blue, // Menambahkan warna biru untuk menunjukkan bahwa ini adalah tautan
                      decoration:
                          TextDecoration.underline, // Menambahkan garis bawah
                    ),
                  ),
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
                  "${isDescriptionEmpty ? "-" : widget.sick["description"]}",
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
                  "${widget.sick["response"]["status"]}",
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
                  "${widget.sick["response"]["message"]}",
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
                  "${widget.sick["response"]["operator"]}",
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
            if (widget.sick["response"]["status"] == "pending")
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  QButton(
                    label: "Approved",
                    color: primaryColor,
                    onPressed: () async {
                      Map<String, dynamic> confirmed = await Confirmation(
                              description: "Setujui Pengajuan Sakit ?")
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
                              description: "Tolak Pengajuan Sakit ?")
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
