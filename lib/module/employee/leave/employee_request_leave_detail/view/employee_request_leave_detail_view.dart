import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../../../../core.dart';
import '../controller/employee_request_leave_detail_controller.dart';
import '../state/employee_request_leave_detail_state.dart';
import 'package:get_it/get_it.dart';

class EmployeeRequestLeaveDetailView extends StatefulWidget {
  final Map leave;
  const EmployeeRequestLeaveDetailView({
    super.key,
    required this.leave,
  });

  @override
  State<EmployeeRequestLeaveDetailView> createState() =>
      _EmployeeRequestLeaveDetailViewState();
}

class _EmployeeRequestLeaveDetailViewState
    extends State<EmployeeRequestLeaveDetailView> {
  EmployeeRequestLeaveDetailController controller =
      EmployeeRequestLeaveDetailController();

  @override
  void initState() {
    if (GetIt.I.isRegistered<EmployeeRequestLeaveDetailController>()) {
      GetIt.I.unregister<EmployeeRequestLeaveDetailController>();
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
      child: BlocListener<EmployeeRequestLeaveDetailController,
          EmployeeRequestLeaveDetailState>(
        listener: (context, state) {},
        child: BlocBuilder<EmployeeRequestLeaveDetailController,
            EmployeeRequestLeaveDetailState>(
          builder: (context, state) {
            final bloc = context.read<EmployeeRequestLeaveDetailController>();
            return buildView(context, bloc, state);
          },
        ),
      ),
    );
  }

  Widget buildView(
    BuildContext context,
    EmployeeRequestLeaveDetailController controller,
    EmployeeRequestLeaveDetailState state,
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

    return Scaffold(
      appBar: AppBar(
        title: const Text('Info Cuti'),
        actions: widget.leave["response"]["status"] == "pending"
            ? [
                IconButton(
                  onPressed: () => controller.deleteLeave(widget.leave),
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                    size: 24.0,
                  ),
                ),
                IconButton(
                  onPressed: () => Get.to(EmployeeFormRequestLeaveView(
                    leave: widget.leave,
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
          ],
        ),
      ),
    );
  }
}
