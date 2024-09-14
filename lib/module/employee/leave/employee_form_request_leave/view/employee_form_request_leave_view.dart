import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core.dart';
import '../controller/employee_form_request_leave_controller.dart';
import '../state/employee_form_request_leave_state.dart';
import 'package:get_it/get_it.dart';

class EmployeeFormRequestLeaveView extends StatefulWidget {
  final Map? leave;
  EmployeeFormRequestLeaveView({
    super.key,
    this.leave,
  });

  @override
  State<EmployeeFormRequestLeaveView> createState() =>
      _EmployeeFormRequestLeaveViewState();
}

class _EmployeeFormRequestLeaveViewState
    extends State<EmployeeFormRequestLeaveView> {
  EmployeeFormRequestLeaveController controller =
      EmployeeFormRequestLeaveController();
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
    bool isNull = widget.leave == null ? true : false;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulir Cuti'),
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
                        value: isNull ? "" : "${widget.leave?["title"]}",
                        onChanged: (value) {
                          state.title = value;
                        },
                      ),
                      QDatePicker(
                        label: "Mulai Cuti",
                        validator: Validator.required,
                        value: (widget.leave?["startLeave"] as Timestamp?)
                            ?.toDate(),
                        onChanged: (value) {
                          state.startLeave = value;
                        },
                      ),
                      QDatePicker(
                        label: "Selesai Cuti",
                        validator: Validator.required,
                        value:
                            (widget.leave?["endLeave"] as Timestamp?)?.toDate(),
                        onChanged: (value) {
                          state.endLeave = value;
                        },
                      ),
                      QTextField(
                        label: "Deskripsi cuti",
                        value: isNull ? "" : "${widget.leave?["description"]}",
                        maxLength: 150,
                        maxLines: 4,
                        horizontal: 30,
                        vertical: 20,
                        helper: "optional",
                        onChanged: (value) {
                          state.description = value;
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            QButton(
              label: "Submit",
              onPressed: () {
                bool isNotValid = formKey.currentState!.validate() == false;
                if (isNotValid) {
                  return;
                }
                isNull
                    ? controller.createLeave()
                    : controller.updateLeave(widget.leave!);
              },
            ),
          ],
        ),
      ),
    );
  }
}
