import 'package:hyper_ui/firebase_options.dart';
import 'package:hyper_ui/module/employee/leave/employee_request_leave/view/employee_request_leave_view.dart';
import 'package:hyper_ui/service/auth_service/auth_service.dart';
import 'package:hyper_ui/state_util.dart';
import 'package:hyper_ui/core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

void main() async {
  configureDependencies();
  WidgetsFlutterBinding.ensureInitialized();
  await DBService.init();
  await Diointerceptors.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Intl.defaultLocale = 'id_ID';
  await initializeDateFormatting('id_ID');
  runMainApp();
}

runMainApp() async {
  return runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget mainView = isLoggedIn ? LoginView() : MainNavigationView();

    return MaterialApp(
      title: 'Login',
      navigatorKey: Get.navigatorKey,
      debugShowCheckedModeBanner: false,
      theme: getDefaultTheme(),
      home: mainView,
      onGenerateRoute: (routeSettings) {
        return null;
      },
      builder: (context, child) {
        return child!;
      },
    );
  }
}
