
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../controller/admin_response_sick_controller.dart';
import '../state/admin_response_sick_state.dart';
import 'package:get_it/get_it.dart';

class AdminResponseSickView extends StatefulWidget {
  const AdminResponseSickView({super.key});

  @override
  State<AdminResponseSickView> createState() => _AdminResponseSickViewState();
}

class _AdminResponseSickViewState extends State<AdminResponseSickView> {
  AdminResponseSickController controller = AdminResponseSickController();

  @override
  void initState() {
    if (GetIt.I.isRegistered<AdminResponseSickController>()) {
      GetIt.I.unregister<AdminResponseSickController>();
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
      child: BlocListener<AdminResponseSickController, AdminResponseSickState>(
        listener: (context, state) {},
        child: BlocBuilder<AdminResponseSickController, AdminResponseSickState>(
          builder: (context, state) {
            final bloc = context.read<AdminResponseSickController>();
            return buildView(context, bloc, state);
          },
        ),
      ),
    );
  }

  Widget buildView(
    BuildContext context,
    AdminResponseSickController controller,
    AdminResponseSickState state,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Response Sick'),
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
    
    