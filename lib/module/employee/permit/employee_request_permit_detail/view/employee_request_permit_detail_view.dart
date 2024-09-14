import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core.dart';
import '../controller/employee_request_permit_detail_controller.dart';
import '../state/employee_request_permit_detail_state.dart';
import 'package:get_it/get_it.dart';

class EmployeeRequestPermitDetailView extends StatefulWidget {
  final Map permit;
  const EmployeeRequestPermitDetailView({
    super.key,
    required this.permit,
  });

  @override
  State<EmployeeRequestPermitDetailView> createState() =>
      _EmployeeRequestPermitDetailViewState();
}

class _EmployeeRequestPermitDetailViewState
    extends State<EmployeeRequestPermitDetailView> {
  EmployeeRequestPermitDetailController controller =
      EmployeeRequestPermitDetailController();

  @override
  void initState() {
    if (GetIt.I.isRegistered<EmployeeRequestPermitDetailController>()) {
      GetIt.I.unregister<EmployeeRequestPermitDetailController>();
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
      child: BlocListener<EmployeeRequestPermitDetailController,
          EmployeeRequestPermitDetailState>(
        listener: (context, state) {},
        child: BlocBuilder<EmployeeRequestPermitDetailController,
            EmployeeRequestPermitDetailState>(
          builder: (context, state) {
            final bloc = context.read<EmployeeRequestPermitDetailController>();
            return buildView(context, bloc, state);
          },
        ),
      ),
    );
  }

  Widget buildView(
    BuildContext context,
    EmployeeRequestPermitDetailController controller,
    EmployeeRequestPermitDetailState state,
  ) {
    bool isDescriptionEmpty = widget.permit["description"] == "" ||
        widget.permit["description"] == null;
    String permitDate = DateFormat('EEEE, dd MMMM yyyy')
        .format(widget.permit["permitDate"].toDate());
    String decisionDate = widget.permit["response"]["responseDate"] != null
        ? DateFormat('EEEE, dd MMMM yyyy')
            .format(widget.permit["response"]["responseDate"].toDate())
        : "-";

    return Scaffold(
      appBar: AppBar(
        title: const Text('Info izin'),
        actions: widget.permit["response"]["status"] == "pending"
            ? [
                IconButton(
                  onPressed: () => controller.deletePermit(widget.permit),
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                    size: 24.0,
                  ),
                ),
                IconButton(
                  onPressed: () => Get.to(EmployeeFormRequestPermitView(
                    permit: widget.permit,
                  )),
                  icon: const Icon(
                    Icons.edit,
                    size: 24.0,
                  ),
                ),
              ]
            : [],
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
          ],
        ),
      ),
    );
  }
}
