import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hyper_ui/module/employee/leave/employee_request_leave/view/employee_request_leave_view.dart';
import '../../../../core.dart';
import '../controller/employee_menu_controller.dart';
import '../state/employee_menu_state.dart';
import 'package:get_it/get_it.dart';

class EmployeeMenuView extends StatefulWidget {
  const EmployeeMenuView({super.key});

  @override
  State<EmployeeMenuView> createState() => _EmployeeMenuViewState();
}

class _EmployeeMenuViewState extends State<EmployeeMenuView> {
  EmployeeMenuController controller = EmployeeMenuController();

  @override
  void initState() {
    if (GetIt.I.isRegistered<EmployeeMenuController>()) {
      GetIt.I.unregister<EmployeeMenuController>();
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
      child: BlocListener<EmployeeMenuController, EmployeeMenuState>(
        listener: (context, state) {},
        child: BlocBuilder<EmployeeMenuController, EmployeeMenuState>(
          builder: (context, state) {
            final bloc = context.read<EmployeeMenuController>();
            return buildView(context, bloc, state);
          },
        ),
      ),
    );
  }

  Widget buildView(
    BuildContext context,
    EmployeeMenuController controller,
    EmployeeMenuState state,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Employee Menu'),
      ),
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: Builder(builder: (context) {
          List items = [
            {
              "icon": Icons.event_available_sharp,
              "label": "Cuti",
              "onTap": () {
                Get.to(EmployeeRequestLeaveView());
              },
            },
            {
              "icon": Icons.assignment_turned_in_sharp,
              "label": "Izin",
              "onTap": () {
                Get.to(EmployeeRequestPermitView());
              },
            },
            {
              "icon": Icons.medical_services_sharp,
              "label": "Sakit",
              "onTap": () {
                Get.to(EmployeeRequestSickView());
              },
            },
          ];

          return GridView.builder(
            padding: EdgeInsets.zero,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 1.0,
              crossAxisCount: 3,
              mainAxisSpacing: 6,
              crossAxisSpacing: 6,
            ),
            itemCount: items.length,
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              var item = items[index];
              return InkWell(
                onTap: () => item["onTap"](),
                child: Container(
                  child: Column(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(12.0),
                            ),
                          ),
                          child: FittedBox(
                            child: Icon(
                              item["icon"],
                              color: primaryColor,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        item["label"],
                        style: TextStyle(
                          fontSize: 14.0,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }),
      ),
    );
  }
}
