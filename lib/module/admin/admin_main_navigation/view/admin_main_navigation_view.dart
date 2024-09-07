import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hyper_ui/core.dart';
import 'package:hyper_ui/module/profile/profile_setting/view/profile_setting_view.dart';
import '../controller/admin_main_navigation_controller.dart';
import '../state/admin_main_navigation_state.dart';
import 'package:get_it/get_it.dart';

class AdminMainNavigationView extends StatefulWidget {
  const AdminMainNavigationView({super.key});

  @override
  State<AdminMainNavigationView> createState() =>
      _AdminMainNavigationViewState();
}

class _AdminMainNavigationViewState extends State<AdminMainNavigationView> {
  AdminMainNavigationController controller = AdminMainNavigationController();

  @override
  void initState() {
    if (GetIt.I.isRegistered<AdminMainNavigationController>()) {
      GetIt.I.unregister<AdminMainNavigationController>();
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
          BlocListener<AdminMainNavigationController, AdminMainNavigationState>(
        listener: (context, state) {},
        child: BlocBuilder<AdminMainNavigationController,
            AdminMainNavigationState>(
          builder: (context, state) {
            final bloc = context.read<AdminMainNavigationController>();
            return buildView(context, bloc, state);
          },
        ),
      ),
    );
  }

  Widget buildView(
    BuildContext context,
    AdminMainNavigationController controller,
    AdminMainNavigationState state,
  ) {
    return QNavigation(
      mode: QNavigationMode.nav2,
      pages: [
        AdminDashboardView(),
        ProfileSettingView(),
      ],
      menus: [
        NavigationMenu(
          icon: Icons.dashboard,
          label: "Dashboard",
        ),
        NavigationMenu(
          icon: Icons.person,
          label: "Profile",
        ),
      ],
    );
  }
}
