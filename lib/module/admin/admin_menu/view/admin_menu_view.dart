import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core.dart';
import '../controller/admin_menu_controller.dart';
import '../state/admin_menu_state.dart';
import 'package:get_it/get_it.dart';

class AdminMenuView extends StatefulWidget {
  const AdminMenuView({super.key});

  @override
  State<AdminMenuView> createState() => _AdminMenuViewState();
}

class _AdminMenuViewState extends State<AdminMenuView> {
  AdminMenuController controller = AdminMenuController();

  @override
  void initState() {
    if (GetIt.I.isRegistered<AdminMenuController>()) {
      GetIt.I.unregister<AdminMenuController>();
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
      child: BlocListener<AdminMenuController, AdminMenuState>(
        listener: (context, state) {},
        child: BlocBuilder<AdminMenuController, AdminMenuState>(
          builder: (context, state) {
            final bloc = context.read<AdminMenuController>();
            return buildView(context, bloc, state);
          },
        ),
      ),
    );
  }

  Widget buildView(
    BuildContext context,
    AdminMenuController controller,
    AdminMenuState state,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Menu'),
      ),
      body: Builder(builder: (context) {
        List items = [
          {
            "icon": Icons.event_available_sharp,
            "label": "Cuti",
            "onTap": () {
              Get.to(AdminLeavesApprovalView());
            },
          },
          {
            "icon": Icons.assignment_turned_in_sharp,
            "label": "Izin",
            "onTap": () {
              Get.to(AdminPermitApprovalView());
            },
          },
          {
            "icon": Icons.medical_services_sharp,
            "label": "Sakit",
            "onTap": () {
              Get.to(AdminSickApprovalView());
            },
          },
          {
            "icon": Icons.groups_sharp,
            "label": "Karyawan",
            "onTap": () {
              Get.to(AdminListUserView());
            },
          },
          {
            "icon": Icons.qr_code,
            "label": "QR Absen",
            "onTap": () {
              Get.to(AdminListUserQrView());
            },
          },
          {
            "icon": Icons.how_to_reg_sharp,
            "label": "Presensi",
            "onTap": () {
              Get.to(AdminPresenceView());
            },
          },
          {
            "icon": Icons.description_sharp,
            "label": "Laporan",
            "onTap": () {
              Get.to(ReportView());
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
    );
  }
}
