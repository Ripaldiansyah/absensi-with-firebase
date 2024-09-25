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
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Stack(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(
                          top: 28.0,
                        ),
                        padding: const EdgeInsets.all(12.0),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              8.0,
                            ),
                          ),
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 20.0,
                            ),
                            Text(
                              DBService.get("name")!,
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              DBService.get("idEmployee") ?? "id isn setting",
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.phone,
                                      size: 12.0,
                                    ),
                                    SizedBox(
                                      width: 4.0,
                                    ),
                                    Text(
                                      DBService.get("phoneNumber")!,
                                      style: TextStyle(
                                        fontSize: 12.0,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 8.0,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.shield,
                                      size: 12.0,
                                    ),
                                    SizedBox(
                                      width: 4.0,
                                    ),
                                    Text(
                                      DBService.get("role")!,
                                      style: TextStyle(
                                        fontSize: 12.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: QButton(
                                    label: "Edit Profile",
                                    onPressed: () {
                                      controller.editProfile();
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                Expanded(
                                  child: QButton(
                                    label: "Logout",
                                    color: dangerColor,
                                    onPressed: () {
                                      controller.logout();
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child: CircleAvatar(
                          radius: 26.0,
                          backgroundColor: Colors.grey[800],
                          child: Icon(
                            MdiIcons.domain,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
