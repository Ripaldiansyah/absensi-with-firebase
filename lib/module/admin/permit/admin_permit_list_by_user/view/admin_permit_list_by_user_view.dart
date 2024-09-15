import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core.dart';
import '../../../../../core_package.dart';
import '../controller/admin_permit_list_by_user_controller.dart';
import '../state/admin_permit_list_by_user_state.dart';
import 'package:get_it/get_it.dart';

class AdminPermitListByUserView extends StatefulWidget {
  final Map userPermit;
  const AdminPermitListByUserView({
    super.key,
    required this.userPermit,
  });

  @override
  State<AdminPermitListByUserView> createState() =>
      _AdminPermitListByUserViewState();
}

class _AdminPermitListByUserViewState extends State<AdminPermitListByUserView> {
  AdminPermitListByUserController controller =
      AdminPermitListByUserController();

  @override
  void initState() {
    if (GetIt.I.isRegistered<AdminPermitListByUserController>()) {
      GetIt.I.unregister<AdminPermitListByUserController>();
    }
    GetIt.I.registerSingleton(controller);
    controller.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => controller.ready(),
    );
    controller.fetchRequestPermits(widget.userPermit["user"]["userId"]);
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
      child: BlocListener<AdminPermitListByUserController,
          AdminPermitListByUserState>(
        listener: (context, state) {},
        child: BlocBuilder<AdminPermitListByUserController,
            AdminPermitListByUserState>(
          builder: (context, state) {
            final bloc = context.read<AdminPermitListByUserController>();
            return buildView(context, bloc, state);
          },
        ),
      ),
    );
  }

  Widget buildView(
    BuildContext context,
    AdminPermitListByUserController controller,
    AdminPermitListByUserState state,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Izin Pengguna'),
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
                controller.fetchSearchRequestPermits(
                    value, widget.userPermit["user"]["userId"]);
              },
              onSubmitted: (value) {},
            ),
            Expanded(
              child: state.permits == null
                  ? Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      itemCount: state.permits?.length ?? 0,
                      physics: const ScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        var sortedPermits = state.permits!
                          ..sort((a, b) =>
                              b["requestDate"].compareTo(a["requestDate"]));
                        var permit = sortedPermits[index];
                        return InkWell(
                          onTap: () => Get.to(AdminPermitDetailView(
                            permit: permit,
                          )),
                          child: Card(
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundColor: Colors.white,
                                child: Icon(
                                  permit["response"]["status"] == "rejected"
                                      ? Icons.close
                                      : permit["response"]["status"] ==
                                              "approved"
                                          ? Icons.check
                                          : Icons.hourglass_top,
                                  color:
                                      permit["response"]["status"] == "rejected"
                                          ? Colors.red
                                          : permit["response"]["status"] ==
                                                  "approved"
                                              ? Colors.green
                                              : Colors.grey,
                                ),
                              ),
                              title: Text(permit["title"] ?? 'No Title'),
                              subtitle: Text(
                                permit["requestDate"] != null
                                    ? DateFormat('dd MMMM yyyy')
                                        .format(permit["requestDate"].toDate())
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
