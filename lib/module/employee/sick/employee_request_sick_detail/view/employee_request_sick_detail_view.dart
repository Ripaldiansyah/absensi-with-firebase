import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hyper_ui/core.dart';
import '../controller/employee_request_sick_detail_controller.dart';
import '../state/employee_request_sick_detail_state.dart';
import 'package:get_it/get_it.dart';

class EmployeeRequestSickDetailView extends StatefulWidget {
  final Map sick;
  const EmployeeRequestSickDetailView({
    super.key,
    required this.sick,
  });

  @override
  State<EmployeeRequestSickDetailView> createState() =>
      _EmployeeRequestSickDetailViewState();
}

class _EmployeeRequestSickDetailViewState
    extends State<EmployeeRequestSickDetailView> {
  EmployeeRequestSickDetailController controller =
      EmployeeRequestSickDetailController();

  @override
  void initState() {
    if (GetIt.I.isRegistered<EmployeeRequestSickDetailController>()) {
      GetIt.I.unregister<EmployeeRequestSickDetailController>();
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
      child: BlocListener<EmployeeRequestSickDetailController,
          EmployeeRequestSickDetailState>(
        listener: (context, state) {},
        child: BlocBuilder<EmployeeRequestSickDetailController,
            EmployeeRequestSickDetailState>(
          builder: (context, state) {
            final bloc = context.read<EmployeeRequestSickDetailController>();
            return buildView(context, bloc, state);
          },
        ),
      ),
    );
  }

  Widget buildView(
    BuildContext context,
    EmployeeRequestSickDetailController controller,
    EmployeeRequestSickDetailState state,
  ) {
    bool isDescriptionEmpty =
        widget.sick["description"] == "" || widget.sick["description"] == null;
    String startDate = DateFormat('EEEE, dd MMMM yyyy')
        .format(widget.sick["startDate"].toDate());
    String endDate = DateFormat('EEEE, dd MMMM yyyy')
        .format(widget.sick["endDate"].toDate());
    String decisionDate = widget.sick["response"]["responseDate"] != null
        ? DateFormat('EEEE, dd MMMM yyyy')
            .format(widget.sick["response"]["responseDate"].toDate())
        : "-";

    return Scaffold(
      appBar: AppBar(
        title: const Text('Info Sakit'),
        actions: widget.sick["response"]["status"] == "pending"
            ? [
                IconButton(
                  onPressed: () => controller.deleteSick(widget.sick),
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                    size: 24.0,
                  ),
                ),
                IconButton(
                  onPressed: () => Get.to(EmployeeFormRequestSickView(
                    sick: widget.sick,
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
                  "Tanggal Sakit",
                  style: TextStyle(fontSize: 15.0),
                ),
                Text(
                  "${startDate}",
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
                  "${endDate}",
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
          ],
        ),
      ),
    );
  }
}
