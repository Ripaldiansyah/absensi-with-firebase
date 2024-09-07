// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import 'module/admin/admin_dashboard/controller/admin_dashboard_controller.dart'
    as _i714;
import 'module/admin/admin_main_navigation/controller/admin_main_navigation_controller.dart'
    as _i491;
import 'module/auth/login/controller/login_controller.dart' as _i994;
import 'module/employee/employee_dashboard/controller/employee_dashboard_controller.dart'
    as _i973;
import 'module/employee/employee_main_navigation/controller/employee_main_navigation_controller.dart'
    as _i970;
import 'module/profile/profile_edit/controller/profile_edit_controller.dart'
    as _i216;
import 'module/profile/profile_setting/controller/profile_setting_controller.dart'
    as _i63;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i714.AdminDashboardController>(
        () => _i714.AdminDashboardController());
    gh.singleton<_i491.AdminMainNavigationController>(
        () => _i491.AdminMainNavigationController());
    gh.singleton<_i994.LoginController>(() => _i994.LoginController());
    gh.singleton<_i973.EmployeeDashboardController>(
        () => _i973.EmployeeDashboardController());
    gh.singleton<_i970.EmployeeMainNavigationController>(
        () => _i970.EmployeeMainNavigationController());
    gh.singleton<_i63.ProfileSettingController>(
        () => _i63.ProfileSettingController());
    gh.singleton<_i216.ProfileEditController>(
        () => _i216.ProfileEditController());
    return this;
  }
}
