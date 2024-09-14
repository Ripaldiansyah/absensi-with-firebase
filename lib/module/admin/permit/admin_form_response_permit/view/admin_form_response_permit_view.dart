
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../controller/admin_form_response_permit_controller.dart';
import '../state/admin_form_response_permit_state.dart';
import 'package:get_it/get_it.dart';

class AdminFormResponsePermitView extends StatefulWidget {
  const AdminFormResponsePermitView({super.key});

  @override
  State<AdminFormResponsePermitView> createState() => _AdminFormResponsePermitViewState();
}

class _AdminFormResponsePermitViewState extends State<AdminFormResponsePermitView> {
  AdminFormResponsePermitController controller = AdminFormResponsePermitController();

  @override
  void initState() {
    if (GetIt.I.isRegistered<AdminFormResponsePermitController>()) {
      GetIt.I.unregister<AdminFormResponsePermitController>();
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
      child: BlocListener<AdminFormResponsePermitController, AdminFormResponsePermitState>(
        listener: (context, state) {},
        child: BlocBuilder<AdminFormResponsePermitController, AdminFormResponsePermitState>(
          builder: (context, state) {
            final bloc = context.read<AdminFormResponsePermitController>();
            return buildView(context, bloc, state);
          },
        ),
      ),
    );
  }

  Widget buildView(
    BuildContext context,
    AdminFormResponsePermitController controller,
    AdminFormResponsePermitState state,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Form Response Permit'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Counter: ${state.counter}',
            style: const TextStyle(fontSize: 24),
          ),
          IconButton(
            onPressed: () => controller.increment(),
            icon: const Icon(
              Icons.add,
              size: 24.0,
            ),
          ),
        ],
      ),
    );
  }
}
    
    