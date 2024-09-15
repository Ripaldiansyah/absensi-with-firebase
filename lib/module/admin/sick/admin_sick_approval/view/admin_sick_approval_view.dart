import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core.dart';
import '../controller/admin_sick_approval_controller.dart';
import '../state/admin_sick_approval_state.dart';
import 'package:get_it/get_it.dart';

class AdminSickApprovalView extends StatefulWidget {
  const AdminSickApprovalView({super.key});

  @override
  State<AdminSickApprovalView> createState() => _AdminSickApprovalViewState();
}

class _AdminSickApprovalViewState extends State<AdminSickApprovalView> {
  AdminSickApprovalController controller = AdminSickApprovalController();

  @override
  void initState() {
    if (GetIt.I.isRegistered<AdminSickApprovalController>()) {
      GetIt.I.unregister<AdminSickApprovalController>();
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
      child: BlocListener<AdminSickApprovalController, AdminSickApprovalState>(
        listener: (context, state) {},
        child: BlocBuilder<AdminSickApprovalController, AdminSickApprovalState>(
          builder: (context, state) {
            final bloc = context.read<AdminSickApprovalController>();
            return buildView(context, bloc, state);
          },
        ),
      ),
    );
  }

  Widget buildView(
    BuildContext context,
    AdminSickApprovalController controller,
    AdminSickApprovalState state,
  ) {
    state.users == null ? controller.getRequestSicks() : state.users;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Sakit Pengguna '),
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
                controller.searchUserSick(value);
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
                        var userSick = state.users![index];

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () => Get.to(AdminSickListByUserView(
                                userSick: userSick,
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
                                              "${userSick["user"]["name"]}",
                                              style: TextStyle(
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              "${userSick["user"]["role"]}",
                                              style: TextStyle(
                                                fontSize: 14.0,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      if (userSick["user"]["countPending"] != 0)
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
                                                  "${userSick["user"]["countPending"]}",
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
