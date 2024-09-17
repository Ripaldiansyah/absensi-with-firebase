
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../controller/admin_presence_controller.dart';
import '../state/admin_presence_state.dart';
import 'package:get_it/get_it.dart';

class AdminPresenceView extends StatefulWidget {
  const AdminPresenceView({super.key});

  @override
  State<AdminPresenceView> createState() => _AdminPresenceViewState();
}

class _AdminPresenceViewState extends State<AdminPresenceView> {
  AdminPresenceController controller = AdminPresenceController();

  @override
  void initState() {
    if (GetIt.I.isRegistered<AdminPresenceController>()) {
      GetIt.I.unregister<AdminPresenceController>();
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
      child: BlocListener<AdminPresenceController, AdminPresenceState>(
        listener: (context, state) {},
        child: BlocBuilder<AdminPresenceController, AdminPresenceState>(
          builder: (context, state) {
            final bloc = context.read<AdminPresenceController>();
            return buildView(context, bloc, state);
          },
        ),
      ),
    );
  }

  Widget buildView(
    BuildContext context,
    AdminPresenceController controller,
    AdminPresenceState state,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Presence'),
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
    
    