import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core.dart';

import 'package:get_it/get_it.dart';

class ReportView extends StatefulWidget {
  const ReportView({super.key});

  @override
  State<ReportView> createState() => _ReportViewState();
}

class _ReportViewState extends State<ReportView> {
  ReportController controller = ReportController();

  @override
  void initState() {
    if (GetIt.I.isRegistered<ReportController>()) {
      GetIt.I.unregister<ReportController>();
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
      child: BlocListener<ReportController, ReportState>(
        listener: (context, state) {},
        child: BlocBuilder<ReportController, ReportState>(
          builder: (context, state) {
            final bloc = context.read<ReportController>();
            return buildView(context, bloc, state);
          },
        ),
      ),
    );
  }

  Widget buildView(
    BuildContext context,
    ReportController controller,
    ReportState state,
  ) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 100,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: primaryColor,
            ),
            child: Text(
              "Report",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    QDropdownField(
                      label: "Periode Report",
                      validator: Validator.required,
                      items: const [
                        {
                          "label": "Harian",
                          "value": "daily",
                        },
                        {
                          "label": "Bulanan",
                          "value": "monthly",
                        }
                      ],
                      onChanged: (value, label) {
                        state.isMonthly = value == "monthly"
                            ? true
                            : value == "daily"
                                ? false
                                : null;

                        controller.emitView();
                      },
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    if (state.isMonthly ?? false)
                      QDropdownField(
                        label: "Pilih Bulan",
                        validator: Validator.required,
                        items: controller.getMonth(),
                        onChanged: (value, label) {
                          state.monthYear = value == "-" ? null : value;
                          controller.emitView();
                        },
                      ),
                  ],
                ),
              )
            ],
          ),
          const Expanded(
            child: SizedBox(),
          ),
          if (state.isMonthly == false || state.monthYear != null)
            Padding(
              padding: EdgeInsets.all(20.0),
              child: QButton(
                label: "Download Report",
                onPressed: () {
                  state.isMonthly == true
                      ? controller.getMonthlyDataPresence(state.monthYear!)
                      : controller.getDailyDataPresence();
                },
              ),
            ),
        ],
      ),
    );
  }
}
