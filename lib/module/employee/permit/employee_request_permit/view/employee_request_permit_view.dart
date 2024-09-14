import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core.dart';
import '../controller/employee_request_permit_controller.dart';
import '../state/employee_request_permit_state.dart';
import 'package:get_it/get_it.dart';

class EmployeeRequestPermitView extends StatefulWidget {
  const EmployeeRequestPermitView({super.key});

  @override
  State<EmployeeRequestPermitView> createState() =>
      _EmployeeRequestPermitViewState();
}

class _EmployeeRequestPermitViewState extends State<EmployeeRequestPermitView> {
  EmployeeRequestPermitController controller =
      EmployeeRequestPermitController();

  @override
  void initState() {
    if (GetIt.I.isRegistered<EmployeeRequestPermitController>()) {
      GetIt.I.unregister<EmployeeRequestPermitController>();
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
      child: BlocListener<EmployeeRequestPermitController,
          EmployeeRequestPermitState>(
        listener: (context, state) {},
        child: BlocBuilder<EmployeeRequestPermitController,
            EmployeeRequestPermitState>(
          builder: (context, state) {
            final bloc = context.read<EmployeeRequestPermitController>();
            return buildView(context, bloc, state);
          },
        ),
      ),
    );
  }

  Widget buildView(
    BuildContext context,
    EmployeeRequestPermitController controller,
    EmployeeRequestPermitState state,
  ) {
    state.permits == null ? controller.fetchRequestPermits() : state.permits;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Izin'),
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
                    controller.fetchSearchRequestPermits(value);
                  },
                  onSubmitted: (value) {},
                ),
                Expanded(
                  child: state.permits == null
                      ? Center(
                          child:
                              CircularProgressIndicator()) // Show loader if data is not yet loaded
                      : ListView.builder(
                          itemCount: state.permits?.length ?? 0,
                          physics: const ScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            var sortedPermits = state.permits!
                              ..sort((a, b) =>
                                  b["requestDate"].compareTo(a["requestDate"]));
                            var permit = sortedPermits[index];
                            return InkWell(
                              onTap: () =>
                                  Get.to(EmployeeRequestPermitDetailView(
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
                                      color: permit["response"]["status"] ==
                                              "rejected"
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
                                        ? DateFormat('dd MMMM yyyy').format(
                                            permit["requestDate"].toDate())
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
                onPressed: () => Get.to(EmployeeFormRequestPermitView()),
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
