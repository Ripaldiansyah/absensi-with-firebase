import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core.dart';
import '../controller/employee_form_request_leave_controller.dart';
import '../state/employee_form_request_leave_state.dart';
import 'package:get_it/get_it.dart';

class EmployeeFormRequestLeaveView extends StatefulWidget {
  const EmployeeFormRequestLeaveView({super.key});

  @override
  State<EmployeeFormRequestLeaveView> createState() =>
      _EmployeeFormRequestLeaveViewState();
}

class _EmployeeFormRequestLeaveViewState
    extends State<EmployeeFormRequestLeaveView> {
  EmployeeFormRequestLeaveController controller =
      EmployeeFormRequestLeaveController();
  DateTime? startLeaveDate;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    if (GetIt.I.isRegistered<EmployeeFormRequestLeaveController>()) {
      GetIt.I.unregister<EmployeeFormRequestLeaveController>();
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
      child: BlocListener<EmployeeFormRequestLeaveController,
          EmployeeFormRequestLeaveState>(
        listener: (context, state) {},
        child: BlocBuilder<EmployeeFormRequestLeaveController,
            EmployeeFormRequestLeaveState>(
          builder: (context, state) {
            final bloc = context.read<EmployeeFormRequestLeaveController>();
            return buildView(context, bloc, state);
          },
        ),
      ),
    );
  }

  Widget buildView(
    BuildContext context,
    EmployeeFormRequestLeaveController controller,
    EmployeeFormRequestLeaveState state,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Employee Form Request Leave'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: Container(
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      QTextField(
                        label: "Alasan Cuti",
                        validator: Validator.required,
                        value: null,
                        onChanged: (value) {},
                      ),
                      QDatePicker(
                        label: "Mulai Cuti",
                        validator: Validator.required,
                        value: null,
                        onChanged: (value) {
                          startLeaveDate = value;
                        },
                      ),
                      QDatePicker(
                        label: "Selesai Cuti",
                        validator: Validator.required,
                        value: null,
                        onChanged: (value) {},
                      ),
                      QTextField(
                        label: "Deskripsi cuti",
                        value: null,
                        maxLength: 150,
                        maxLines: 4,
                        horizontal: 30,
                        vertical: 20,
                        helper: "optional",
                        onChanged: (value) {},
                      ),
                    ],
                  ),
                ),
              ),
            ),
            QButton(
              label: "Ajukan",
              onPressed: () {
                bool isNotValid = formKey.currentState!.validate() == false;
                if (isNotValid) {
                  return;
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
