// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import 'module/admin/admin_menu/controller/admin_menu_controller.dart' as _i549;
import 'module/admin/leave/admin_leaves_approval/controller/admin_leaves_approval_controller.dart'
    as _i255;
import 'module/admin/leave/admin_leaves_detail/controller/admin_leaves_detail_controller.dart'
    as _i1001;
import 'module/admin/leave/admin_leaves_list_by_user/controller/admin_leaves_list_by_user_controller.dart'
    as _i137;
import 'module/admin/permit/admin_form_response_permit/controller/admin_form_response_permit_controller.dart'
    as _i361;
import 'module/admin/permit/admin_response_permit/controller/admin_response_permit_controller.dart'
    as _i142;
import 'module/admin/permit/admin_response_permit_detail/controller/admin_response_permit_detail_controller.dart'
    as _i848;
import 'module/admin/sick/admin_form_response_sick/controller/admin_form_response_sick_controller.dart'
    as _i449;
import 'module/admin/sick/admin_response_sick/controller/admin_response_sick_controller.dart'
    as _i601;
import 'module/admin/sick/admin_response_sick_detail/controller/admin_response_sick_detail_controller.dart'
    as _i36;
import 'module/auth/login/controller/login_controller.dart' as _i994;
import 'module/dashboard/controller/dashboard_controller.dart' as _i157;
import 'module/employee/employee_menu/controller/employee_menu_controller.dart'
    as _i14;
import 'module/employee/leave/employee_form_request_leave/controller/employee_form_request_leave_controller.dart'
    as _i1062;
import 'module/employee/leave/employee_request_leave/controller/employee_request_leave_controller.dart'
    as _i30;
import 'module/employee/leave/employee_request_leave_detail/controller/employee_request_leave_detail_controller.dart'
    as _i15;
import 'module/employee/permit/employee_form_request_permit/controller/employee_form_request_permit_controller.dart'
    as _i990;
import 'module/employee/permit/employee_request_permit/controller/employee_request_permit_controller.dart'
    as _i493;
import 'module/employee/permit/employee_request_permit_detail/controller/employee_request_permit_detail_controller.dart'
    as _i823;
import 'module/employee/sick/employee_form_request_sick/controller/employee_form_request_sick_controller.dart'
    as _i167;
import 'module/employee/sick/employee_request_sick/controller/employee_request_sick_controller.dart'
    as _i751;
import 'module/employee/sick/employee_request_sick_detail/controller/employee_request_sick_detail_controller.dart'
    as _i955;
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
    gh.singleton<_i1062.EmployeeFormRequestLeaveController>(
        () => _i1062.EmployeeFormRequestLeaveController());
    gh.singleton<_i30.EmployeeRequestLeaveController>(
        () => _i30.EmployeeRequestLeaveController());
    gh.singleton<_i15.EmployeeRequestLeaveDetailController>(
        () => _i15.EmployeeRequestLeaveDetailController());
    gh.singleton<_i255.AdminLeavesApprovalController>(
        () => _i255.AdminLeavesApprovalController());
    gh.singleton<_i1001.AdminLeavesDetailController>(
        () => _i1001.AdminLeavesDetailController());
    gh.singleton<_i137.AdminLeavesListByUserController>(
        () => _i137.AdminLeavesListByUserController());
    gh.singleton<_i493.EmployeeRequestPermitController>(
        () => _i493.EmployeeRequestPermitController());
    gh.singleton<_i823.EmployeeRequestPermitDetailController>(
        () => _i823.EmployeeRequestPermitDetailController());
    gh.singleton<_i990.EmployeeFormRequestPermitController>(
        () => _i990.EmployeeFormRequestPermitController());
    gh.singleton<_i751.EmployeeRequestSickController>(
        () => _i751.EmployeeRequestSickController());
    gh.singleton<_i955.EmployeeRequestSickDetailController>(
        () => _i955.EmployeeRequestSickDetailController());
    gh.singleton<_i167.EmployeeFormRequestSickController>(
        () => _i167.EmployeeFormRequestSickController());
    gh.singleton<_i142.AdminResponsePermitController>(
        () => _i142.AdminResponsePermitController());
    gh.singleton<_i361.AdminFormResponsePermitController>(
        () => _i361.AdminFormResponsePermitController());
    gh.singleton<_i848.AdminResponsePermitDetailController>(
        () => _i848.AdminResponsePermitDetailController());
    gh.singleton<_i601.AdminResponseSickController>(
        () => _i601.AdminResponseSickController());
    gh.singleton<_i36.AdminResponseSickDetailController>(
        () => _i36.AdminResponseSickDetailController());
    gh.singleton<_i449.AdminFormResponseSickController>(
        () => _i449.AdminFormResponseSickController());
    return this;
  }
}
