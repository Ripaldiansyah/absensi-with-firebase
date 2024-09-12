// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import 'module/admin/admin_leaves_approval/controller/admin_leaves_approval_controller.dart'
    as _i766;
import 'module/admin/admin_leaves_detail/controller/admin_leaves_detail_controller.dart'
    as _i727;
import 'module/admin/admin_leaves_list_by_user/controller/admin_leaves_list_by_user_controller.dart'
    as _i432;
import 'module/admin/admin_menu/controller/admin_menu_controller.dart' as _i549;
import 'module/auth/login/controller/login_controller.dart' as _i994;
import 'module/dashboard/controller/dashboard_controller.dart' as _i157;
import 'module/employee/employee_form_request_leave/controller/employee_form_request_leave_controller.dart'
    as _i134;
import 'module/employee/employee_menu/controller/employee_menu_controller.dart'
    as _i14;
import 'module/employee/employee_request_leave/controller/employee_request_leave_controller.dart'
    as _i411;
import 'module/employee/employee_request_leave_detail/controller/employee_request_leave_detail_controller.dart'
    as _i471;
import 'module/main_navigation/controller/main_navigation_controller.dart'
    as _i164;
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
    gh.singleton<_i994.LoginController>(() => _i994.LoginController());
    gh.singleton<_i63.ProfileSettingController>(
        () => _i63.ProfileSettingController());
    gh.singleton<_i216.ProfileEditController>(
        () => _i216.ProfileEditController());
    gh.singleton<_i157.DashboardController>(() => _i157.DashboardController());
    gh.singleton<_i164.MainNavigationController>(
        () => _i164.MainNavigationController());
    gh.singleton<_i14.EmployeeMenuController>(
        () => _i14.EmployeeMenuController());
    gh.singleton<_i549.AdminMenuController>(() => _i549.AdminMenuController());
    gh.singleton<_i411.EmployeeRequestLeaveController>(
        () => _i411.EmployeeRequestLeaveController());
    gh.singleton<_i471.EmployeeRequestLeaveDetailController>(
        () => _i471.EmployeeRequestLeaveDetailController());
    gh.singleton<_i134.EmployeeFormRequestLeaveController>(
        () => _i134.EmployeeFormRequestLeaveController());
    gh.singleton<_i766.AdminLeavesApprovalController>(
        () => _i766.AdminLeavesApprovalController());
    gh.singleton<_i432.AdminLeavesListByUserController>(
        () => _i432.AdminLeavesListByUserController());
    gh.singleton<_i727.AdminLeavesDetailController>(
        () => _i727.AdminLeavesDetailController());
    return this;
  }
}
