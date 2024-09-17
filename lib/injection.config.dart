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
import 'module/admin/permit/admin_permit_approval/controller/admin_permit_approval_controller.dart'
    as _i426;
import 'module/admin/permit/admin_permit_detail/controller/admin_permit_detail_controller.dart'
    as _i1039;
import 'module/admin/permit/admin_permit_list_by_user/controller/admin_permit_list_by_user_controller.dart'
    as _i161;
import 'module/admin/presence/admin_presence/controller/admin_presence_controller.dart'
    as _i1046;
import 'module/admin/qr/admin_list_user_qr/controller/admin_list_user_qr_controller.dart'
    as _i336;
import 'module/admin/qr/admin_qr_generator/controller/admin_qr_generator_controller.dart'
    as _i456;
import 'module/admin/sick/admin_sick_approval/controller/admin_sick_approval_controller.dart'
    as _i473;
import 'module/admin/sick/admin_sick_detail/controller/admin_sick_detail_controller.dart'
    as _i564;
import 'module/admin/sick/admin_sick_list_by_user/controller/admin_sick_list_by_user_controller.dart'
    as _i503;
import 'module/admin/users/admin_detail_user/controller/admin_detail_user_controller.dart'
    as _i229;
import 'module/admin/users/admin_form_user/controller/admin_form_user_controller.dart'
    as _i388;
import 'module/admin/users/admin_list_user/controller/admin_list_user_controller.dart'
    as _i930;
import 'module/admin/users/success_register/controller/success_register_controller.dart'
    as _i84;
import 'module/auth/login/controller/login_controller.dart' as _i994;
import 'module/dashboard/controller/dashboard_controller.dart' as _i157;
import 'module/employee/employee_activity/controller/employee_activity_controller.dart'
    as _i935;
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
import 'module/qr_camera/controller/qr_camera_controller.dart' as _i367;

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
    gh.singleton<_i549.AdminMenuController>(() => _i549.AdminMenuController());
    gh.singleton<_i255.AdminLeavesApprovalController>(
        () => _i255.AdminLeavesApprovalController());
    gh.singleton<_i1001.AdminLeavesDetailController>(
        () => _i1001.AdminLeavesDetailController());
    gh.singleton<_i137.AdminLeavesListByUserController>(
        () => _i137.AdminLeavesListByUserController());
    gh.singleton<_i426.AdminPermitApprovalController>(
        () => _i426.AdminPermitApprovalController());
    gh.singleton<_i1039.AdminPermitDetailController>(
        () => _i1039.AdminPermitDetailController());
    gh.singleton<_i161.AdminPermitListByUserController>(
        () => _i161.AdminPermitListByUserController());
    gh.singleton<_i336.AdminListUserQrController>(
        () => _i336.AdminListUserQrController());
    gh.singleton<_i456.AdminQrGeneratorController>(
        () => _i456.AdminQrGeneratorController());
    gh.singleton<_i473.AdminSickApprovalController>(
        () => _i473.AdminSickApprovalController());
    gh.singleton<_i564.AdminSickDetailController>(
        () => _i564.AdminSickDetailController());
    gh.singleton<_i503.AdminSickListByUserController>(
        () => _i503.AdminSickListByUserController());
    gh.singleton<_i229.AdminDetailUserController>(
        () => _i229.AdminDetailUserController());
    gh.singleton<_i388.AdminFormUserController>(
        () => _i388.AdminFormUserController());
    gh.singleton<_i930.AdminListUserController>(
        () => _i930.AdminListUserController());
    gh.singleton<_i84.SuccessRegisterController>(
        () => _i84.SuccessRegisterController());
    gh.singleton<_i994.LoginController>(() => _i994.LoginController());
    gh.singleton<_i157.DashboardController>(() => _i157.DashboardController());
    gh.singleton<_i935.EmployeeActivityController>(
        () => _i935.EmployeeActivityController());
    gh.singleton<_i14.EmployeeMenuController>(
        () => _i14.EmployeeMenuController());
    gh.singleton<_i1062.EmployeeFormRequestLeaveController>(
        () => _i1062.EmployeeFormRequestLeaveController());
    gh.singleton<_i30.EmployeeRequestLeaveController>(
        () => _i30.EmployeeRequestLeaveController());
    gh.singleton<_i15.EmployeeRequestLeaveDetailController>(
        () => _i15.EmployeeRequestLeaveDetailController());
    gh.singleton<_i990.EmployeeFormRequestPermitController>(
        () => _i990.EmployeeFormRequestPermitController());
    gh.singleton<_i493.EmployeeRequestPermitController>(
        () => _i493.EmployeeRequestPermitController());
    gh.singleton<_i823.EmployeeRequestPermitDetailController>(
        () => _i823.EmployeeRequestPermitDetailController());
    gh.singleton<_i167.EmployeeFormRequestSickController>(
        () => _i167.EmployeeFormRequestSickController());
    gh.singleton<_i751.EmployeeRequestSickController>(
        () => _i751.EmployeeRequestSickController());
    gh.singleton<_i955.EmployeeRequestSickDetailController>(
        () => _i955.EmployeeRequestSickDetailController());
    gh.singleton<_i164.MainNavigationController>(
        () => _i164.MainNavigationController());
    gh.singleton<_i216.ProfileEditController>(
        () => _i216.ProfileEditController());
    gh.singleton<_i63.ProfileSettingController>(
        () => _i63.ProfileSettingController());
    gh.singleton<_i367.QrCameraController>(() => _i367.QrCameraController());
    gh.singleton<_i1046.AdminPresenceController>(
        () => _i1046.AdminPresenceController());
    return this;
  }
}
