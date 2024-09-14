import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hyper_ui/shared/widget/form/textfield/text_field.dart';
import '../../../../../core.dart';
import '../controller/employee_form_request_sick_controller.dart';
import '../state/employee_form_request_sick_state.dart';
import 'package:get_it/get_it.dart';

class EmployeeFormRequestSickView extends StatefulWidget {
  final Map? sick;
  const EmployeeFormRequestSickView({
    super.key,
    this.sick,
  });

  @override
  State<EmployeeFormRequestSickView> createState() =>
      _EmployeeFormRequestSickViewState();
}

class _EmployeeFormRequestSickViewState
    extends State<EmployeeFormRequestSickView> {
  EmployeeFormRequestSickController controller =
      EmployeeFormRequestSickController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    if (GetIt.I.isRegistered<EmployeeFormRequestSickController>()) {
      GetIt.I.unregister<EmployeeFormRequestSickController>();
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
      child: BlocListener<EmployeeFormRequestSickController,
          EmployeeFormRequestSickState>(
        listener: (context, state) {},
        child: BlocBuilder<EmployeeFormRequestSickController,
            EmployeeFormRequestSickState>(
          builder: (context, state) {
            final bloc = context.read<EmployeeFormRequestSickController>();
            return buildView(context, bloc, state);
          },
        ),
      ),
    );
  }

  Widget buildView(
    BuildContext context,
    EmployeeFormRequestSickController controller,
    EmployeeFormRequestSickState state,
  ) {
    bool isNull = widget.sick == null ? true : false;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulir Sakit'),
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
                        label: "Jenis Penyakit",
                        validator: Validator.required,
                        value: isNull ? "" : "${widget.sick?["title"]}",
                        onChanged: (value) {
                          state.title = value;
                        },
                      ),
                      QDatePicker(
                        label: "Mulai sakit",
                        validator: Validator.required,
                        value:
                            (widget.sick?["startDate"] as Timestamp?)?.toDate(),
                        onChanged: (value) {
                          state.startDate = value;
                        },
                      ),
                      QDatePicker(
                        label: "Perkiraan sembuh",
                        validator: Validator.required,
                        value:
                            (widget.sick?["endDate"] as Timestamp?)?.toDate(),
                        onChanged: (value) {
                          state.endDate = value;
                        },
                      ),
                      QImagePicker(
                        label: "Surat Sakit",
                        validator: Validator.required,
                        value: null,
                        onChanged: (value) {},
                      ),
                      QTextField(
                        label: "Deskripsi Sakit",
                        value: isNull ? "" : "${widget.sick?["description"]}",
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
                    ? controller.createSick()
                    : controller.updateSick(widget.sick!);
              },
            ),
          ],
        ),
      ),
    );
  }
}
