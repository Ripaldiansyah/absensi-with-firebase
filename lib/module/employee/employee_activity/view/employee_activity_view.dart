import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core.dart';
import '../controller/employee_activity_controller.dart';
import '../state/employee_activity_state.dart';
import 'package:get_it/get_it.dart';

class EmployeeActivityView extends StatefulWidget {
  const EmployeeActivityView({super.key});

  @override
  State<EmployeeActivityView> createState() => _EmployeeActivityViewState();
}

class _EmployeeActivityViewState extends State<EmployeeActivityView> {
  EmployeeActivityController controller = EmployeeActivityController();

  @override
  void initState() {
    if (GetIt.I.isRegistered<EmployeeActivityController>()) {
      GetIt.I.unregister<EmployeeActivityController>();
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
      child: BlocListener<EmployeeActivityController, EmployeeActivityState>(
        listener: (context, state) {},
        child: BlocBuilder<EmployeeActivityController, EmployeeActivityState>(
          builder: (context, state) {
            final bloc = context.read<EmployeeActivityController>();
            return buildView(context, bloc, state);
          },
        ),
      ),
    );
  }

  Widget buildView(
    BuildContext context,
    EmployeeActivityController controller,
    EmployeeActivityState state,
  ) {
    state.history == null
        ? controller.getHistoryAttendance(DateFormat('MMMM yyyy').format(now))
        : state.history;

    return Scaffold(
      appBar: AppBar(
        title: const Text('History Presensi'),
      ),
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Container(
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(12.0),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "${state.history?.where((item) => item["checkIn"] != null).length ?? 0}",
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "Presensi",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ListView.separated(
                  itemCount: state.history?.length ?? 0,
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  separatorBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 4.0,
                    );
                  },
                  itemBuilder: (BuildContext context, int index) {
                    String attendanceDate = state.history?[index]["checkIn"] ==
                                null ||
                            !(state.history?[index]["checkIn"] is Timestamp)
                        ? DateFormat('dd').format((Timestamp.now()).toDate())
                        : DateFormat('dd').format(
                            (state.history?[index]["checkIn"] as Timestamp)
                                .toDate());
                    String attendanceMonth = state.history?[index]["checkIn"] ==
                                null ||
                            !(state.history?[index]["checkIn"] is Timestamp)
                        ? DateFormat('MMMM').format((Timestamp.now()).toDate())
                        : DateFormat('MMMM').format(
                            (state.history?[index]["checkIn"] as Timestamp)
                                .toDate());
                    String checkIn = state.history?[index]["checkIn"] == null ||
                            !(state.history?[index]["checkIn"] is Timestamp)
                        ? "00:00"
                        : DateFormat('HH:mm').format(
                            (state.history?[index]["checkIn"] as Timestamp)
                                .toDate());
                    String checkOut = state.history?[index]["checkOut"] ==
                                null ||
                            !(state.history?[index]["checkOut"] is Timestamp)
                        ? "00:00"
                        : DateFormat('HH:mm').format(
                            (state.history?[index]["checkOut"] as Timestamp)
                                .toDate());
                    Duration duration = state.history?[index]["checkOut"] !=
                                null &&
                            state.history?[index]["checkIn"] != null
                        ? (state.history?[index]["checkOut"] as Timestamp)
                            .toDate()
                            .difference(
                                (state.history?[index]["checkIn"] as Timestamp)
                                    .toDate())
                        : Duration.zero;

                    String formattedDuration = duration == Duration.zero
                        ? "Belum Checkout"
                        : "${duration.inHours} Jam ${duration.inMinutes.remainder(60)} Menit ";

                    if (state.history?[index]["checkIn"] != null)
                      return Card(
                        child: ListTile(
                          leading: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "${attendanceDate}",
                                style: TextStyle(
                                  fontSize: 20.0,
                                ),
                              ),
                              Text(
                                "${attendanceMonth}",
                                style: TextStyle(
                                  fontSize: 10.0,
                                ),
                              ),
                            ],
                          ),
                          title: SizedBox(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                  child: Container(
                                    child: Column(
                                      children: [
                                        Text(
                                          "Check in",
                                          style: TextStyle(
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          "${checkIn}",
                                          style: TextStyle(
                                            fontSize: 14.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    child: Column(
                                      children: [
                                        Text(
                                          "Check Out",
                                          style: TextStyle(
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          "${checkOut}",
                                          style: TextStyle(
                                            fontSize: 14.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    child: Column(
                                      children: [
                                        Text(
                                          "Durasi kerja",
                                          style: TextStyle(
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          "${formattedDuration}",
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontSize: 14.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    return null;
                  },
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 10,
            right: MediaQuery.of(context).size.width / 4,
            child: Container(
              height: 45,
              width: MediaQuery.of(context).size.width / 2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(12.0),
                ),
              ),
              child: QDropdownField(
                label: "",
                items: controller.getMonth(),
                onChanged: (value, label) {
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (context) => Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                  Future.delayed(Duration(milliseconds: 300), () {
                    controller.getHistoryAttendance(value).then((_) {
                      Navigator.of(context).pop();
                    });
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
