
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../controller/admin_response_permit_detail_controller.dart';
import '../state/admin_response_permit_detail_state.dart';
import 'package:get_it/get_it.dart';

class AdminResponsePermitDetailView extends StatefulWidget {
  const AdminResponsePermitDetailView({super.key});

  @override
  State<AdminResponsePermitDetailView> createState() => _AdminResponsePermitDetailViewState();
}

class _AdminResponsePermitDetailViewState extends State<AdminResponsePermitDetailView> {
  AdminResponsePermitDetailController controller = AdminResponsePermitDetailController();

  @override
  void initState() {
    if (GetIt.I.isRegistered<AdminResponsePermitDetailController>()) {
      GetIt.I.unregister<AdminResponsePermitDetailController>();
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
      child: BlocListener<AdminResponsePermitDetailController, AdminResponsePermitDetailState>(
        listener: (context, state) {},
        child: BlocBuilder<AdminResponsePermitDetailController, AdminResponsePermitDetailState>(
          builder: (context, state) {
            final bloc = context.read<AdminResponsePermitDetailController>();
            return buildView(context, bloc, state);
          },
        ),
      ),
    );
  }

  Widget buildView(
    BuildContext context,
    AdminResponsePermitDetailController controller,
    AdminResponsePermitDetailState state,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Response Permit Detail'),
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
    
    