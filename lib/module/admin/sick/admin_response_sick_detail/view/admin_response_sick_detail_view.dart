
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../controller/admin_response_sick_detail_controller.dart';
import '../state/admin_response_sick_detail_state.dart';
import 'package:get_it/get_it.dart';

class AdminResponseSickDetailView extends StatefulWidget {
  const AdminResponseSickDetailView({super.key});

  @override
  State<AdminResponseSickDetailView> createState() => _AdminResponseSickDetailViewState();
}

class _AdminResponseSickDetailViewState extends State<AdminResponseSickDetailView> {
  AdminResponseSickDetailController controller = AdminResponseSickDetailController();

  @override
  void initState() {
    if (GetIt.I.isRegistered<AdminResponseSickDetailController>()) {
      GetIt.I.unregister<AdminResponseSickDetailController>();
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
      child: BlocListener<AdminResponseSickDetailController, AdminResponseSickDetailState>(
        listener: (context, state) {},
        child: BlocBuilder<AdminResponseSickDetailController, AdminResponseSickDetailState>(
          builder: (context, state) {
            final bloc = context.read<AdminResponseSickDetailController>();
            return buildView(context, bloc, state);
          },
        ),
      ),
    );
  }

  Widget buildView(
    BuildContext context,
    AdminResponseSickDetailController controller,
    AdminResponseSickDetailState state,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Response Sick Detail'),
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
    
    