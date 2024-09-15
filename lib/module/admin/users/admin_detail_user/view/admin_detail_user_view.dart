import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core.dart';
import '../controller/admin_detail_user_controller.dart';
import '../state/admin_detail_user_state.dart';
import 'package:get_it/get_it.dart';

class AdminDetailUserView extends StatefulWidget {
  final Map<String, dynamic> userDetail;
  const AdminDetailUserView({
    super.key,
    required this.userDetail,
  });

  State<AdminDetailUserView> createState() => _AdminDetailUserViewState();
}

class _AdminDetailUserViewState extends State<AdminDetailUserView> {
  AdminDetailUserController controller = AdminDetailUserController();

  void initState() {
    if (GetIt.I.isRegistered<AdminDetailUserController>()) {
      GetIt.I.unregister<AdminDetailUserController>();
    }
    GetIt.I.registerSingleton(controller);
    controller.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => controller.ready(),
    );
    super.initState();
  }

  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => controller,
      child: BlocListener<AdminDetailUserController, AdminDetailUserState>(
        listener: (context, state) {},
        child: BlocBuilder<AdminDetailUserController, AdminDetailUserState>(
          builder: (context, state) {
            final bloc = context.read<AdminDetailUserController>();
            return buildView(context, bloc, state);
          },
        ),
      ),
    );
  }

  Widget buildView(
    BuildContext context,
    AdminDetailUserController controller,
    AdminDetailUserState state,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Success Register'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: QButton(
                          label: "Ubah Akun",
                          onPressed: () {
                            Get.to(AdminFormUserView(
                              userData: widget.userDetail,
                            ));
                          },
                        ),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Expanded(
                        child: QButton(
                          label: "Hapus Akun",
                          color: Colors.red,
                          onPressed: () async {
                            try {
                              await controller.deleteAccount(widget.userDetail);
                              Get.back();
                              ss("Akun telah terhapus");
                            } catch (e) {
                              se(e);
                            }
                          },
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
