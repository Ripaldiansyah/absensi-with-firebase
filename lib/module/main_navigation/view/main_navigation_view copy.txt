import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hyper_ui/core.dart';
import 'package:hyper_ui/module/profile/profile_setting/view/profile_setting_view.dart';
import '../controller/main_navigation_controller.dart';
import '../state/main_navigation_state.dart';
import 'package:get_it/get_it.dart';

class MainNavigationView extends StatefulWidget {
  const MainNavigationView({super.key});

  @override
  State<MainNavigationView> createState() => _MainNavigationViewState();
}

class _MainNavigationViewState extends State<MainNavigationView> {
  MainNavigationController controller = MainNavigationController();

  @override
  void initState() {
    if (GetIt.I.isRegistered<MainNavigationController>()) {
      GetIt.I.unregister<MainNavigationController>();
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
      child: BlocListener<MainNavigationController, MainNavigationState>(
        listener: (context, state) {},
        child: BlocBuilder<MainNavigationController, MainNavigationState>(
          builder: (context, state) {
            final bloc = context.read<MainNavigationController>();
            return buildView(context, bloc, state);
          },
        ),
      ),
    );
  }

  Widget buildView(
    BuildContext context,
    MainNavigationController controller,
    MainNavigationState state,
  ) {
    Widget menu =
        DBService.get("role") == "admin" ? AdminMenuView() : EmployeeMenuView();
    return QNavigation(
      mode: QNavigationMode.nav2,
      pages: [
        DashboardView(),
        menu,
        ProfileSettingView(),
      ],
      menus: [
        NavigationMenu(
          icon: Icons.dashboard,
          label: "Dashboard",
        ),
        NavigationMenu(
          icon: Icons.widgets,
          label: "Menu",
        ),
        NavigationMenu(
          icon: Icons.person,
          label: "Profile",
        ),
      ],
    );
  }
}
