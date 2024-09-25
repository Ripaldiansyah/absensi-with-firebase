import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core.dart';
import '../controller/admin_presence_controller.dart';
import '../state/admin_presence_state.dart';
import 'package:get_it/get_it.dart';

class AdminPresenceView extends StatefulWidget {
  const AdminPresenceView({super.key});

  @override
  State<AdminPresenceView> createState() => _AdminPresenceViewState();
}

class _AdminPresenceViewState extends State<AdminPresenceView> {
  AdminPresenceController controller = AdminPresenceController();

  @override
  void initState() {
    if (GetIt.I.isRegistered<AdminPresenceController>()) {
      GetIt.I.unregister<AdminPresenceController>();
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
      child: BlocListener<AdminPresenceController, AdminPresenceState>(
        listener: (context, state) {},
        child: BlocBuilder<AdminPresenceController, AdminPresenceState>(
          builder: (context, state) {
            final bloc = context.read<AdminPresenceController>();
            return buildView(context, bloc, state);
          },
        ),
      ),
    );
  }

  Widget buildView(
    BuildContext context,
    AdminPresenceController controller,
    AdminPresenceState state,
  ) {
    state.userPresence == null
        ? controller.getPresence(DateFormat('MMMM yyyy').format(now),
            DateFormat('dd MMMM yyyy').format(now))
        : state.userPresence;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Presensi'),
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
                                  "${state.userPresence?.where((item) => item["checkIn"] != null).length ?? 0}",
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
                  itemCount: state.userPresence?.length ?? 0,
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  separatorBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 4.0,
                    );
                  },
                  itemBuilder: (BuildContext context, int index) {
                    String checkIn = state.userPresence?[index]["checkIn"] ==
                                null ||
                            !(state.userPresence?[index]["checkIn"]
                                is Timestamp)
                        ? "00:00"
                        : DateFormat('HH:mm').format(
                            (state.userPresence?[index]["checkIn"] as Timestamp)
                                .toDate());
                    String checkOut = state.userPresence?[index]["checkOut"] ==
                                null ||
                            !(state.userPresence?[index]["checkOut"]
                                is Timestamp)
                        ? "00:00"
                        : DateFormat('HH:mm').format((state.userPresence?[index]
                                ["checkOut"] as Timestamp)
                            .toDate());
                    Duration duration = state.userPresence?[index]
                                    ["checkOut"] !=
                                null &&
                            state.userPresence?[index]["checkIn"] != null
                        ? (state.userPresence?[index]["checkOut"] as Timestamp)
                            .toDate()
                            .difference((state.userPresence?[index]["checkIn"]
                                    as Timestamp)
                                .toDate())
                        : Duration.zero;

                    String formattedDuration = duration == Duration.zero
                        ? "Belum Checkout"
                        : "${duration.inHours} Jam ${duration.inMinutes.remainder(60)} Menit ";

                    if (state.userPresence?[index]["checkOut"] != null)
                      return Card(
                        child: ListTile(
                          leading: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "${state.userPresence?[index]["name"]}",
                                      style: TextStyle(
                                        fontSize: 20.0,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(
                                      "${state.userPresence?[index]["role"]}",
                                      style: TextStyle(
                                        fontSize: 10.0,
                                      ),
                                    ),
                                  ],
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
                    if (state.userPresence?[index]["checkOut"] == null)
                      return Card(
                        child: ListTile(
                          leading: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "${state.userPresence?[index]["name"]}",
                                      style: TextStyle(
                                        fontSize: 20.0,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(
                                      "${state.userPresence?[index]["role"]}",
                                      style: TextStyle(
                                        fontSize: 10.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          title: SizedBox(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Container(
                                    child: Column(
                                      children: [
                                        Text(
                                          "Belum Check in",
                                          style: TextStyle(
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.bold,
                                            overflow: TextOverflow.ellipsis,
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
            right: 20,
            child: Container(
              height: 45,
              width: MediaQuery.of(context).size.width / 2.5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(12.0),
                ),
              ),
              child: QDropdownField(
                label: "Tanggal",
                items: state.dateMonthYear ??
                    controller.getDate(DateFormat('MMMM yyyy').format(now)),
                onChanged: (value, label) {
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (context) => Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                  Future.delayed(Duration(milliseconds: 300), () {
                    final parts = value.split(' ');
                    final monthYear = '${parts[1]} ${parts[2]}';
                    controller.getPresence(monthYear, value).then((_) {
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
