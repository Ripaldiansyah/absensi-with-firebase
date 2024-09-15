import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../../../../../core.dart';
import '../controller/admin_qr_generator_controller.dart';
import '../state/admin_qr_generator_state.dart';
import 'package:get_it/get_it.dart';

class AdminQrGeneratorView extends StatefulWidget {
  final Map<String, dynamic> userDetail;
  //data dari userDetail {idEmployee: SMP53770-106, phoneNumber: 08123456789, role: admin, name: admin, statusAccount: enable, userId: X2VmxjWsoFaXhkwuCTykHHGJTBu1, email: admin@mail.com}
  const AdminQrGeneratorView({
    super.key,
    required this.userDetail,
  });

  @override
  State<AdminQrGeneratorView> createState() => _AdminQrGeneratorViewState();
}

class _AdminQrGeneratorViewState extends State<AdminQrGeneratorView> {
  AdminQrGeneratorController controller = AdminQrGeneratorController();
  @override
  void initState() {
    if (GetIt.I.isRegistered<AdminQrGeneratorController>()) {
      GetIt.I.unregister<AdminQrGeneratorController>();
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
      child: BlocListener<AdminQrGeneratorController, AdminQrGeneratorState>(
        listener: (context, state) {},
        child: BlocBuilder<AdminQrGeneratorController, AdminQrGeneratorState>(
          builder: (context, state) {
            final bloc = context.read<AdminQrGeneratorController>();
            return buildView(context, bloc, state);
          },
        ),
      ),
    );
  }

  Widget buildView(
    BuildContext context,
    AdminQrGeneratorController controller,
    AdminQrGeneratorState state,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR Absensi'),
      ),
      body: SingleChildScrollView(
        controller: ScrollController(),
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(12.0),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x19000000),
                      blurRadius: 24,
                      offset: Offset(0, 11),
                    ),
                  ],
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      8.0,
                    ),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    FutureBuilder<dynamic>(
                      future: controller.qrData(widget.userDetail),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        } else if (snapshot.hasError) {
                          return Center(
                              child: Text(
                                  'Error: ${controller.printAnything(snapshot.error)}'));
                        } else if (snapshot.hasData) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 3,
                                child: PrettyQrView(
                                  qrImage: snapshot.data,
                                  decoration: PrettyQrDecoration(
                                    shape: PrettyQrSmoothSymbol(
                                      color: primaryColor,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        } else {
                          return Center(
                              child: Text(
                                  'No data found')); // Tampilkan jika tidak ada data
                        }
                      },
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "NIK Karyawan",
                                style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "${widget.userDetail["idEmployee"]}",
                                style: TextStyle(
                                  fontSize: 12.0,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Nama",
                                style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "${widget.userDetail["name"]}",
                                style: TextStyle(
                                  fontSize: 14.0,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Email",
                                style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "${widget.userDetail["email"]}",
                                style: TextStyle(
                                  fontSize: 14.0,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "No. Telephone",
                                style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "${widget.userDetail["phoneNumber"]}",
                                style: TextStyle(
                                  fontSize: 14.0,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Jabatan",
                                style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "${widget.userDetail["role"]}",
                                style: TextStyle(
                                  fontSize: 14.0,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
