import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core.dart';
import '../controller/admin_list_user_qr_controller.dart';
import '../state/admin_list_user_qr_state.dart';
import 'package:get_it/get_it.dart';

class AdminListUserQrView extends StatefulWidget {
  const AdminListUserQrView({super.key});

  @override
  State<AdminListUserQrView> createState() => _AdminListUserQrViewState();
}

class _AdminListUserQrViewState extends State<AdminListUserQrView> {
  AdminListUserQrController controller = AdminListUserQrController();

  @override
  void initState() {
    if (GetIt.I.isRegistered<AdminListUserQrController>()) {
      GetIt.I.unregister<AdminListUserQrController>();
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
      child: BlocListener<AdminListUserQrController, AdminListUserQrState>(
        listener: (context, state) {},
        child: BlocBuilder<AdminListUserQrController, AdminListUserQrState>(
          builder: (context, state) {
            final bloc = context.read<AdminListUserQrController>();
            return buildView(context, bloc, state);
          },
        ),
      ),
    );
  }

  Widget buildView(
    BuildContext context,
    AdminListUserQrController controller,
    AdminListUserQrState state,
  ) {
    state.users == null ? controller.getUser() : state.users;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Karyawan'),
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
                controller.searchUser(value);
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
                        var user = state.users![index];
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () async {
                                final userDetail =
                                    await getUserById(user["userId"]);

                                Get.to(AdminQrGeneratorView(
                                  userDetail: userDetail!,
                                ));
                              },
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
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "${user["idEmployee"]}",
                                                  style: TextStyle(
                                                    fontSize: 18.0,
                                                    fontWeight: FontWeight.bold,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ),
                                                Text(
                                                  " - ",
                                                  style: TextStyle(
                                                    fontSize: 18.0,
                                                  ),
                                                ),
                                                Text(
                                                  "${user["name"]}",
                                                  style: TextStyle(
                                                    fontSize: 18.0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                )
                                              ],
                                            ),
                                            Text(
                                              "${user["role"]}",
                                              style: TextStyle(
                                                fontSize: 14.0,
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
