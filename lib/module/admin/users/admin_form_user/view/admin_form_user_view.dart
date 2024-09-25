import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core.dart';
import '../controller/admin_form_user_controller.dart';
import '../state/admin_form_user_state.dart';
import 'package:get_it/get_it.dart';

class AdminFormUserView extends StatefulWidget {
  final Map<String, dynamic>? userData;
  const AdminFormUserView({
    super.key,
    this.userData,
  });

  @override
  State<AdminFormUserView> createState() => _AdminFormUserViewState();
}

class _AdminFormUserViewState extends State<AdminFormUserView> {
  AdminFormUserController controller = AdminFormUserController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  void initState() {
    if (GetIt.I.isRegistered<AdminFormUserController>()) {
      GetIt.I.unregister<AdminFormUserController>();
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
      child: BlocListener<AdminFormUserController, AdminFormUserState>(
        listener: (context, state) {},
        child: BlocBuilder<AdminFormUserController, AdminFormUserState>(
          builder: (context, state) {
            final bloc = context.read<AdminFormUserController>();
            return buildView(context, bloc, state);
          },
        ),
      ),
    );
  }

  Widget buildView(
    BuildContext context,
    AdminFormUserController controller,
    AdminFormUserState state,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulir penambahan pengguna'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SingleChildScrollView(
              controller: ScrollController(),
              child: Form(
                key: formKey,
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      if (widget.userData?["idEmployee"] == null)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            QTextField(
                              label: "NIK Karyawan",
                              hint: "Masukan NIK Karyawan",
                              validator: Validator.required,
                              suffixIcon: null,
                              value: widget.userData?["email"],
                              onChanged: (value) {
                                state.email = value;
                              },
                            ),
                            QTextField(
                              label: "Email",
                              hint: "Masukan Email",
                              validator: Validator.email,
                              suffixIcon: null,
                              value: widget.userData?["email"],
                              onChanged: (value) {
                                state.email = value;
                              },
                            ),
                            QTextField(
                              label: "Password",
                              maxLines: null,
                              obscure: true,
                              hint: "Masukan password",
                              validator: Validator.password,
                              suffixIcon: Icons.password,
                              value: null,
                              onChanged: (value) {
                                state.password = value;
                              },
                            ),
                            QTextField(
                              label: "Password Konfirmasi",
                              maxLines: null,
                              obscure: true,
                              hint: "Masukan password Konfirmasi",
                              validator: Validator.password,
                              suffixIcon: Icons.password,
                              value: null,
                              onChanged: (value) {
                                state.passwordConfirm = value;
                              },
                            ),
                          ],
                        ),
                      QTextField(
                        label: "Nama Lengkap",
                        hint: "Masukan Nama Lengkap",
                        validator: Validator.required,
                        suffixIcon: null,
                        value: widget.userData?["name"],
                        onChanged: (value) {
                          state.name = value;
                        },
                      ),
                      QNumberField(
                        label: "Nomor Hp",
                        validator: Validator.required,
                        value: widget.userData?["phoneNumber"],
                        hideSuffix: true,
                        onChanged: (value) {
                          state.phoneNumber = value;
                        },
                      ),
                      QDropdownField(
                        label: "Roles",
                        validator: Validator.required,
                        items: const [
                          {
                            "label": "Admin",
                            "value": "admin",
                          },
                          {
                            "label": "Karyawan",
                            "value": "user",
                          }
                        ],
                        value: widget.userData?["role"],
                        onChanged: (value, label) {
                          state.role = value;
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: QButton(
              label: "Submit",
              onPressed: () async {
                if (widget.userData == null) {
                  bool isNotValid = formKey.currentState!.validate() == false;
                  if (isNotValid) {
                    return;
                  }
                  if (state.password != state.passwordConfirm) {
                    return se(
                        "Pastikan password sesuai dengan password konfirmasi");
                  }

                  try {
                    Map<String, dynamic> userData = await controller.register();
                    Get.to(SuccessRegisterView(
                      userCreated: userData,
                    ));
                  } catch (e) {
                    se(e);
                  }
                }

                if (widget.userData != null) {
                  try {
                    if (state.role != null) {
                      widget.userData!["role"] = state.role;
                    }
                    if (state.phoneNumber != null) {
                      widget.userData!["phoneNumber"] = state.phoneNumber;
                    }
                    if (state.name != null) {
                      widget.userData!["name"] = state.name;
                    }
                    Map<String, dynamic> userData =
                        await controller.updateUser(widget.userData!);
                    userData["isUpdate"] = true;
                    Get.to(SuccessRegisterView(
                      userCreated: userData,
                    ));
                  } catch (e) {
                    se(e);
                  }
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
