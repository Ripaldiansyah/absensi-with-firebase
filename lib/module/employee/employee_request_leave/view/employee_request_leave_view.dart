import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core.dart';
import '../controller/employee_request_leave_controller.dart';
import '../state/employee_request_leave_state.dart';
import 'package:get_it/get_it.dart';

class EmployeeRequestLeaveView extends StatefulWidget {
  const EmployeeRequestLeaveView({super.key});

  @override
  State<EmployeeRequestLeaveView> createState() =>
      _EmployeeRequestLeaveViewState();
}

class _EmployeeRequestLeaveViewState extends State<EmployeeRequestLeaveView> {
  EmployeeRequestLeaveController controller = EmployeeRequestLeaveController();
  List? leaves;

  @override
  void initState() {
    if (GetIt.I.isRegistered<EmployeeRequestLeaveController>()) {
      GetIt.I.unregister<EmployeeRequestLeaveController>();
    }
    GetIt.I.registerSingleton(controller);
    controller.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => controller.ready());

    // Fetch leaves data when the widget initializes
    fetchRequestLeaves();

    super.initState();
  }

  Future<void> fetchRequestLeaves() async {
    final fetchedLeaves = await controller.getRequestLeaves();
    setState(() {
      leaves = fetchedLeaves;
    });
  }

  Future<void> fetchSearchRequestLeaves(String text) async {
    final fetchedLeaves = await controller.searchLeaves(text);
    setState(() {
      leaves = fetchedLeaves;
    });
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
      child: BlocListener<EmployeeRequestLeaveController,
          EmployeeRequestLeaveState>(
        listener: (context, state) {},
        child: BlocBuilder<EmployeeRequestLeaveController,
            EmployeeRequestLeaveState>(
          builder: (context, state) {
            final bloc = context.read<EmployeeRequestLeaveController>();

            return buildView(context, bloc, state);
          },
        ),
      ),
    );
  }

  Widget buildView(
    BuildContext context,
    EmployeeRequestLeaveController controller,
    EmployeeRequestLeaveState state,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Employee Request Leave'),
      ),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                QSearchField(
                  label: "Search",
                  value: null,
                  prefixIcon: Icons.search,
                  suffixIcon: null,
                  onChanged: (value) {
                    fetchSearchRequestLeaves(value);
                  },
                  onSubmitted: (value) {},
                ),
                Expanded(
                  child: leaves == null
                      ? Center(
                          child:
                              CircularProgressIndicator()) // Show loader if data is not yet loaded
                      : ListView.builder(
                          itemCount: leaves?.length ?? 0,
                          physics: const ScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            var leave = leaves?[index];
                            return InkWell(
                              onTap: () =>
                                  Get.to(EmployeeRequestLeaveDetailView(
                                leave: leave,
                              )),
                              child: Card(
                                child: ListTile(
                                  leading: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    child: Icon(
                                      leave["response"]["status"] == "rejected"
                                          ? Icons.close
                                          : leave["response"]["status"] ==
                                                  "approved"
                                              ? Icons.check
                                              : Icons.hourglass_top,
                                      color: leave["response"]["status"] ==
                                              "rejected"
                                          ? Colors.red
                                          : leave["response"]["status"] ==
                                                  "approved"
                                              ? Colors.green
                                              : Colors.grey,
                                    ),
                                  ),
                                  title: Text(leave["title"] ?? 'No Title'),
                                  subtitle: Text(
                                    leave["requestDate"] != null
                                        ? DateFormat('dd MMMM yyyy').format(
                                            leave["requestDate"].toDate())
                                        : 'No Date',
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                ),
              ],
            ),
          ),
          Positioned(
            right: 20,
            bottom: 20,
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(99.0),
                ),
                color: primaryColor,
              ),
              child: IconButton(
                onPressed: () => Get.to(EmployeeFormRequestLeaveView()),
                color: Colors.white,
                icon: const Icon(
                  Icons.add,
                  size: 24.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
