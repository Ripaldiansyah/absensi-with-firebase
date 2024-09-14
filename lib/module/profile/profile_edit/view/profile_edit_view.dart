import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hyper_ui/core.dart';
import '../controller/profile_edit_controller.dart';
import '../state/profile_edit_state.dart';
import 'package:get_it/get_it.dart';

class ProfileEditView extends StatefulWidget {
  const ProfileEditView({super.key});

  @override
  State<ProfileEditView> createState() => _ProfileEditViewState();
}

class _ProfileEditViewState extends State<ProfileEditView> {
  ProfileEditController controller = ProfileEditController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  void initState() {
    if (GetIt.I.isRegistered<ProfileEditController>()) {
      GetIt.I.unregister<ProfileEditController>();
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
      child: BlocListener<ProfileEditController, ProfileEditState>(
        listener: (context, state) {},
        child: BlocBuilder<ProfileEditController, ProfileEditState>(
          builder: (context, state) {
            final bloc = context.read<ProfileEditController>();
            return buildView(context, bloc, state);
          },
        ),
      ),
    );
  }

  Widget buildView(
    BuildContext context,
    ProfileEditController controller,
    ProfileEditState state,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit Profile',
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              QTextField(
                label: "Email Baru",
                validator: Validator.email,
                value: null,
                onChanged: (value) {
                  state.newEmail = value;
                },
              ),
              QNumberField(
                label: "Nomor Hp Baru",
                validator: Validator.required,
                value: null,
                hideSuffix: true,
                onChanged: (value) {
                  state.newPhoneNumber = value;
                },
              ),
              Expanded(
                child: SizedBox(),
              ),
              QButton(
                label: "Save",
                onPressed: () {
                  bool isNotValid = formKey.currentState!.validate() == false;
                  if (isNotValid) {
                    return;
                  }
                  controller.editProfile();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
