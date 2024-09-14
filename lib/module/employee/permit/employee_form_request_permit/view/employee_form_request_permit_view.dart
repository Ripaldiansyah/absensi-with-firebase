import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core.dart';
import '../controller/employee_form_request_permit_controller.dart';
import '../state/employee_form_request_permit_state.dart';
import 'package:get_it/get_it.dart';

class EmployeeFormRequestPermitView extends StatefulWidget {
  final Map? permit;
  const EmployeeFormRequestPermitView({
    super.key,
    this.permit,
  });

  @override
  State<EmployeeFormRequestPermitView> createState() =>
      _EmployeeFormRequestPermitViewState();
}

class _EmployeeFormRequestPermitViewState
    extends State<EmployeeFormRequestPermitView> {
  EmployeeFormRequestPermitController controller =
      EmployeeFormRequestPermitController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    if (GetIt.I.isRegistered<EmployeeFormRequestPermitController>()) {
      GetIt.I.unregister<EmployeeFormRequestPermitController>();
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
      child: BlocListener<EmployeeFormRequestPermitController,
          EmployeeFormRequestPermitState>(
        listener: (context, state) {},
        child: BlocBuilder<EmployeeFormRequestPermitController,
            EmployeeFormRequestPermitState>(
          builder: (context, state) {
            final bloc = context.read<EmployeeFormRequestPermitController>();
            return buildView(context, bloc, state);
          },
        ),
      ),
    );
  }

  Widget buildView(
    BuildContext context,
    EmployeeFormRequestPermitController controller,
    EmployeeFormRequestPermitState state,
  ) {
    bool isNull = widget.permit == null ? true : false;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulir Izin'),
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
                        label: "Alasan Izin",
                        validator: Validator.required,
                        value: isNull ? "" : "${widget.permit?["title"]}",
                        onChanged: (value) {
                          state.title = value;
                        },
                      ),
                      QDatePicker(
                        label: "Tanggal Izin",
                        validator: Validator.required,
                        value: (widget.permit?["permitDate"] as Timestamp?)
                            ?.toDate(),
                        onChanged: (value) {
                          state.permitDate = value;
                        },
                      ),
                      QTextField(
                        label: "Deskripsi Izin",
                        value: isNull ? "" : "${widget.permit?["description"]}",
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
                    ? controller.createPermit()
                    : controller.updatePermit(widget.permit!);
              },
            ),
          ],
        ),
      ),
    );
  }
}
