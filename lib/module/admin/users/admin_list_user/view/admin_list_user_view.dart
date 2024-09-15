import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core.dart';
import '../controller/admin_list_user_controller.dart';
import '../state/admin_list_user_state.dart';
import 'package:get_it/get_it.dart';

class AdminListUserView extends StatefulWidget {
  const AdminListUserView({super.key});

  @override
  State<AdminListUserView> createState() => _AdminListUserViewState();
}

class _AdminListUserViewState extends State<AdminListUserView> {
  AdminListUserController controller = AdminListUserController();

  @override
  void initState() {
    if (GetIt.I.isRegistered<AdminListUserController>()) {
      GetIt.I.unregister<AdminListUserController>();
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
      child: BlocListener<AdminListUserController, AdminListUserState>(
        listener: (context, state) {},
        child: BlocBuilder<AdminListUserController, AdminListUserState>(
          builder: (context, state) {
            final bloc = context.read<AdminListUserController>();
            return buildView(context, bloc, state);
          },
        ),
      ),
    );
  }

  Widget buildView(
    BuildContext context,
    AdminListUserController controller,
    AdminListUserState state,
  ) {
    state.users == null ? controller.getUser() : state.users;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Karyawan'),
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
                                    Get.to(AdminDetailUserView(
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
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        overflow: TextOverflow
                                                            .ellipsis,
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
                                                        fontWeight:
                                                            FontWeight.bold,
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
                onPressed: () => Get.to(AdminFormUserView()),
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
