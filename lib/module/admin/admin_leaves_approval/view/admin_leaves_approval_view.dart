import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core.dart';
import '../controller/admin_leaves_approval_controller.dart';
import '../state/admin_leaves_approval_state.dart';
import 'package:get_it/get_it.dart';

class AdminLeavesApprovalView extends StatefulWidget {
  const AdminLeavesApprovalView({super.key});

  @override
  State<AdminLeavesApprovalView> createState() =>
      _AdminLeavesApprovalViewState();
}

class _AdminLeavesApprovalViewState extends State<AdminLeavesApprovalView> {
  AdminLeavesApprovalController controller = AdminLeavesApprovalController();

  @override
  void initState() {
    if (GetIt.I.isRegistered<AdminLeavesApprovalController>()) {
      GetIt.I.unregister<AdminLeavesApprovalController>();
    }
    GetIt.I.registerSingleton(controller);
    controller.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => controller.ready(),
    );
    controller.fetchRequestLeaves();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => controller,
      child:
          BlocListener<AdminLeavesApprovalController, AdminLeavesApprovalState>(
        listener: (context, state) {},
        child: BlocBuilder<AdminLeavesApprovalController,
            AdminLeavesApprovalState>(
          builder: (context, state) {
            final bloc = context.read<AdminLeavesApprovalController>();

            return buildView(context, bloc, state);
          },
        ),
      ),
    );
  }

  Widget buildView(
    BuildContext context,
    AdminLeavesApprovalController controller,
    AdminLeavesApprovalState state,
  ) {
    controller.getRequestLeaves();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Request Leave'),
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
                    // controller.fetchSearchRequestLeaves(value);
                  },
                  onSubmitted: (value) {},
                ),
                Expanded(
                  child: state.leaves == null
                      ? Center(
                          child:
                              CircularProgressIndicator()) // Show loader if data is not yet loaded
                      : ListView.builder(
                          itemCount: state.leaves?.length ?? 0,
                          physics: const ScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            var sortedLeaves = state.leaves!
                              ..sort((a, b) =>
                                  b["requestDate"].compareTo(a["requestDate"]));
                            var leave = sortedLeaves[index];
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
