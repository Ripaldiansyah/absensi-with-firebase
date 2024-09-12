import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core.dart';
import '../controller/admin_leaves_list_by_user_controller.dart';
import '../state/admin_leaves_list_by_user_state.dart';
import 'package:get_it/get_it.dart';

class AdminLeavesListByUserView extends StatefulWidget {
  final Map userLeave;
  const AdminLeavesListByUserView({
    super.key,
    required this.userLeave,
  });

  @override
  State<AdminLeavesListByUserView> createState() =>
      _AdminLeavesListByUserViewState();
}

class _AdminLeavesListByUserViewState extends State<AdminLeavesListByUserView> {
  AdminLeavesListByUserController controller =
      AdminLeavesListByUserController();

  @override
  void initState() {
    if (GetIt.I.isRegistered<AdminLeavesListByUserController>()) {
      GetIt.I.unregister<AdminLeavesListByUserController>();
    }
    GetIt.I.registerSingleton(controller);
    controller.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => controller.ready(),
    );
    controller.fetchRequestLeaves(widget.userLeave["user"]["userId"]);
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
      child: BlocListener<AdminLeavesListByUserController,
          AdminLeavesListByUserState>(
        listener: (context, state) {},
        child: BlocBuilder<AdminLeavesListByUserController,
            AdminLeavesListByUserState>(
          builder: (context, state) {
            final bloc = context.read<AdminLeavesListByUserController>();
            return buildView(context, bloc, state);
          },
        ),
      ),
    );
  }

  Widget buildView(
    BuildContext context,
    AdminLeavesListByUserController controller,
    AdminLeavesListByUserState state,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Leaves List By User'),
      ),
      body: Padding(
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
                controller.fetchSearchRequestLeaves(
                    value, widget.userLeave["user"]["userId"]);
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
                          onTap: () => Get.to(AdminLeavesDetailView(
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
                                  color:
                                      leave["response"]["status"] == "rejected"
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
                                    ? DateFormat('dd MMMM yyyy')
                                        .format(leave["requestDate"].toDate())
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
    );
  }
}
