import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core.dart';
import '../controller/profile_setting_controller.dart';
import '../state/profile_setting_state.dart';
import 'package:get_it/get_it.dart';

class ProfileSettingView extends StatefulWidget {
  const ProfileSettingView({super.key});

  @override
  State<ProfileSettingView> createState() => _ProfileSettingViewState();
}

class _ProfileSettingViewState extends State<ProfileSettingView> {
  ProfileSettingController controller = ProfileSettingController();

  @override
  void initState() {
    if (GetIt.I.isRegistered<ProfileSettingController>()) {
      GetIt.I.unregister<ProfileSettingController>();
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
      child: BlocListener<ProfileSettingController, ProfileSettingState>(
        listener: (context, state) {},
        child: BlocBuilder<ProfileSettingController, ProfileSettingState>(
          builder: (context, state) {
            final bloc = context.read<ProfileSettingController>();
            return buildView(context, bloc, state);
          },
        ),
      ),
    );
  }

  Widget buildView(
    BuildContext context,
    ProfileSettingController controller,
    ProfileSettingState state,
  ) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                DBService.get("name")!,
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                DBService.get("role")!,
                style: TextStyle(
                  fontSize: 14.0,
                ),
              ),
              Text(
                DBService.get("phoneNumber")!,
                style: TextStyle(
                  fontSize: 14.0,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              QButton(
                label: "Edit Profile",
                onPressed: () {
                  controller.editProfile();
                },
              ),
              const SizedBox(
                height: 10.0,
              ),
              QButton(
                label: "Logout",
                color: dangerColor,
                onPressed: () {
                  controller.logout();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
