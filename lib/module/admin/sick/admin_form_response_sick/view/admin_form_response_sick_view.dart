
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../controller/admin_form_response_sick_controller.dart';
import '../state/admin_form_response_sick_state.dart';
import 'package:get_it/get_it.dart';

class AdminFormResponseSickView extends StatefulWidget {
  const AdminFormResponseSickView({super.key});

  @override
  State<AdminFormResponseSickView> createState() => _AdminFormResponseSickViewState();
}

class _AdminFormResponseSickViewState extends State<AdminFormResponseSickView> {
  AdminFormResponseSickController controller = AdminFormResponseSickController();

  @override
  void initState() {
    if (GetIt.I.isRegistered<AdminFormResponseSickController>()) {
      GetIt.I.unregister<AdminFormResponseSickController>();
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
      child: BlocListener<AdminFormResponseSickController, AdminFormResponseSickState>(
        listener: (context, state) {},
        child: BlocBuilder<AdminFormResponseSickController, AdminFormResponseSickState>(
          builder: (context, state) {
            final bloc = context.read<AdminFormResponseSickController>();
            return buildView(context, bloc, state);
          },
        ),
      ),
    );
  }

  Widget buildView(
    BuildContext context,
    AdminFormResponseSickController controller,
    AdminFormResponseSickState state,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Form Response Sick'),
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
    
    