import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core.dart';
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
    state.users == null ? controller.getRequestLeaves() : state.users;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Cuti Pengguna'),
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
                controller.searchUserLeave(value);
              },
              onSubmitted: (value) {},
            ),
            Expanded(
              child: state.users == null
                  ? Center(
                      child:
                          CircularProgressIndicator()) // Show loader if data is not yet loaded
                  : ListView.builder(
                      itemCount: state.users?.length ?? 0,
                      physics: const ScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        var userLeave = state.users![index];
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () => Get.to(AdminLeavesListByUserView(
                                userLeave: userLeave,
                              )),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: inputColor,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(12.0),
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    left: 20,
                                    right: 20,
                                    top: 5,
                                    bottom: 5,
                                  ),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "${userLeave["user"]["name"]}",
                                              style: TextStyle(
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              "${userLeave["user"]["role"]}",
                                              style: TextStyle(
                                                fontSize: 14.0,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      if (userLeave["user"]["countPending"] !=
                                          0)
                                        Container(
                                          child: Stack(
                                            children: [
                                              CircleAvatar(
                                                backgroundColor:
                                                    scaffoldBackgroundColor,
                                                child: Icon(
                                                  Icons.hourglass_top_sharp,
                                                  color: primaryColor,
                                                ),
                                              ),
                                              Positioned(
                                                right: 1,
                                                child: Text(
                                                  "${userLeave["user"]["countPending"]}",
                                                  style: TextStyle(
                                                    fontSize: 10.0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                          ],
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
