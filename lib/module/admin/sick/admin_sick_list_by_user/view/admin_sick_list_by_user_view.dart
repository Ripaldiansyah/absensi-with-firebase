import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core.dart';
import '../controller/admin_sick_list_by_user_controller.dart';
import '../state/admin_sick_list_by_user_state.dart';
import 'package:get_it/get_it.dart';

class AdminSickListByUserView extends StatefulWidget {
  final Map userSick;
  const AdminSickListByUserView({
    super.key,
    required this.userSick,
  });

  @override
  State<AdminSickListByUserView> createState() =>
      _AdminSickListByUserViewState();
}

class _AdminSickListByUserViewState extends State<AdminSickListByUserView> {
  AdminSickListByUserController controller = AdminSickListByUserController();

  @override
  void initState() {
    if (GetIt.I.isRegistered<AdminSickListByUserController>()) {
      GetIt.I.unregister<AdminSickListByUserController>();
    }
    GetIt.I.registerSingleton(controller);
    controller.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => controller.ready(),
    );
    controller.fetchRequestSicks(widget.userSick["user"]["userId"]);
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
      child:
          BlocListener<AdminSickListByUserController, AdminSickListByUserState>(
        listener: (context, state) {},
        child: BlocBuilder<AdminSickListByUserController,
            AdminSickListByUserState>(
          builder: (context, state) {
            final bloc = context.read<AdminSickListByUserController>();
            return buildView(context, bloc, state);
          },
        ),
      ),
    );
  }

  Widget buildView(
    BuildContext context,
    AdminSickListByUserController controller,
    AdminSickListByUserState state,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Sakit Pengguna'),
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
                controller.fetchSearchRequestSicks(
                    value, widget.userSick["user"]["userId"]);
              },
              onSubmitted: (value) {},
            ),
            Expanded(
              child: state.sicks == null
                  ? Center(
                      child:
                          CircularProgressIndicator()) // Show loader if data is not yet loaded
                  : ListView.builder(
                      itemCount: state.sicks?.length ?? 0,
                      physics: const ScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        var sortedSicks = state.sicks!
                          ..sort((a, b) =>
                              b["requestDate"].compareTo(a["requestDate"]));
                        var sick = sortedSicks[index];

                        return InkWell(
                          onTap: () => Get.to(AdminSickDetailView(
                            sick: sick,
                          )),
                          child: Card(
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundColor: Colors.white,
                                child: Icon(
                                  sick["response"]["status"] == "rejected"
                                      ? Icons.close
                                      : sick["response"]["status"] == "approved"
                                          ? Icons.check
                                          : Icons.hourglass_top,
                                  color: sick["response"]["status"] ==
                                          "rejected"
                                      ? Colors.red
                                      : sick["response"]["status"] == "approved"
                                          ? Colors.green
                                          : Colors.grey,
                                ),
                              ),
                              title: Text(sick["title"] ?? 'No Title'),
                              subtitle: Text(
                                sick["requestDate"] != null
                                    ? DateFormat('dd MMMM yyyy')
                                        .format(sick["requestDate"].toDate())
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
