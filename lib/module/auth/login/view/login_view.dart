import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hyper_ui/core.dart';
import 'package:hyper_ui/module/auth/login/widget/login_title.dart';
import 'package:hyper_ui/shared/util/db_service/db_service.dart';
import '../../../../shared/util/validator/validator.dart';
import '../../../../shared/widget/form/button/action_button.dart';
import '../../../../shared/widget/form/textfield/text_field.dart';
import '../controller/login_controller.dart';
import '../state/login_state.dart';
import 'package:get_it/get_it.dart';

bool isRemember = false;

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  LoginController controller = LoginController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void initState() {
    if (GetIt.I.isRegistered<LoginController>()) {
      GetIt.I.unregister<LoginController>();
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
      child: BlocListener<LoginController, LoginState>(
        listener: (context, state) {},
        child: BlocBuilder<LoginController, LoginState>(
          builder: (context, state) {
            final bloc = context.read<LoginController>();
            return buildView(context, bloc, state);
          },
        ),
      ),
    );
  }

  Widget buildView(
    BuildContext context,
    LoginController controller,
    LoginState state,
  ) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              controller: ScrollController(),
              child: Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/icon/logo.png",
                          height: 60.0,
                          fit: BoxFit.contain,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    login_title(),
                    const SizedBox(
                      height: 30.0,
                    ),
                    QTextField(
                      label: "Email",
                      hint: "Masukan Email",
                      validator: Validator.email,
                      suffixIcon: null,
                      value: isRemember ? DBService.get("email") : null,
                      onChanged: (value) {
                        state.email = value;
                        DBService.set("email", value);
                      },
                    ),
                    QTextField(
                      label: "Password",
                      maxLines: null,
                      obscure: true,
                      hint: "Masukan password",
                      validator: Validator.password,
                      suffixIcon: Icons.password,
                      value: isRemember ? DBService.get("password") : null,
                      onChanged: (value) {
                        state.password = value;
                        DBService.set("password", value);
                      },
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Ingat saya",
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                        Checkbox(
                          value: isRemember,
                          onChanged: (value) {
                            setState(() {
                              isRemember = value!;
                            });
                          },
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    QActionButton(
                      label: "Login",
                      onPressed: () {
                        bool isNotValid =
                            formKey.currentState!.validate() == false;
                        if (isNotValid) {
                          return;
                        }
                        controller.login();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
