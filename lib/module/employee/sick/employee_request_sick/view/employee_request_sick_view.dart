import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core.dart';
import '../controller/employee_request_sick_controller.dart';
import '../state/employee_request_sick_state.dart';
import 'package:get_it/get_it.dart';

class EmployeeRequestSickView extends StatefulWidget {
  const EmployeeRequestSickView({super.key});

  @override
  State<EmployeeRequestSickView> createState() =>
      _EmployeeRequestSickViewState();
}

class _EmployeeRequestSickViewState extends State<EmployeeRequestSickView> {
  EmployeeRequestSickController controller = EmployeeRequestSickController();

  @override
  void initState() {
    if (GetIt.I.isRegistered<EmployeeRequestSickController>()) {
      GetIt.I.unregister<EmployeeRequestSickController>();
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
      child:
          BlocListener<EmployeeRequestSickController, EmployeeRequestSickState>(
        listener: (context, state) {},
        child: BlocBuilder<EmployeeRequestSickController,
            EmployeeRequestSickState>(
          builder: (context, state) {
            final bloc = context.read<EmployeeRequestSickController>();
            return buildView(context, bloc, state);
          },
        ),
      ),
    );
  }

  Widget buildView(
    BuildContext context,
    EmployeeRequestSickController controller,
    EmployeeRequestSickState state,
  ) {
    state.sicks == null ? controller.fetchRequestSicks() : state.sicks;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sakit'),
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
                    controller.fetchSearchRequestSicks(value);
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
                              onTap: () => Get.to(EmployeeRequestSickDetailView(
                                sick: sick,
                              )),
                              child: Card(
                                child: ListTile(
                                  leading: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    child: Icon(
                                      sick["response"]["status"] == "rejected"
                                          ? Icons.close
                                          : sick["response"]["status"] ==
                                                  "approved"
                                              ? Icons.check
                                              : Icons.hourglass_top,
                                      color: sick["response"]["status"] ==
                                              "rejected"
                                          ? Colors.red
                                          : sick["response"]["status"] ==
                                                  "approved"
                                              ? Colors.green
                                              : Colors.grey,
                                    ),
                                  ),
                                  title: Text(sick["title"] ?? 'No Title'),
                                  subtitle: Text(
                                    sick["requestDate"] != null
                                        ? DateFormat('dd MMMM yyyy').format(
                                            sick["requestDate"].toDate())
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
                onPressed: () => Get.to(EmployeeFormRequestSickView()),
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
