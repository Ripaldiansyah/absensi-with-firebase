
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../controller/admin_response_permit_controller.dart';
import '../state/admin_response_permit_state.dart';
import 'package:get_it/get_it.dart';

class AdminResponsePermitView extends StatefulWidget {
  const AdminResponsePermitView({super.key});

  @override
  State<AdminResponsePermitView> createState() => _AdminResponsePermitViewState();
}

class _AdminResponsePermitViewState extends State<AdminResponsePermitView> {
  AdminResponsePermitController controller = AdminResponsePermitController();

  @override
  void initState() {
    if (GetIt.I.isRegistered<AdminResponsePermitController>()) {
      GetIt.I.unregister<AdminResponsePermitController>();
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
      child: BlocListener<AdminResponsePermitController, AdminResponsePermitState>(
        listener: (context, state) {},
        child: BlocBuilder<AdminResponsePermitController, AdminResponsePermitState>(
          builder: (context, state) {
            final bloc = context.read<AdminResponsePermitController>();
            return buildView(context, bloc, state);
          },
        ),
      ),
    );
  }

  Widget buildView(
    BuildContext context,
    AdminResponsePermitController controller,
    AdminResponsePermitState state,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Response Permit'),
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
    
    