// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'admin_sick_approval_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AdminSickApprovalState {
  List<dynamic>? get users => throw _privateConstructorUsedError;
  set users(List<dynamic>? value) => throw _privateConstructorUsedError;

  /// Create a copy of AdminSickApprovalState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AdminSickApprovalStateCopyWith<AdminSickApprovalState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdminSickApprovalStateCopyWith<$Res> {
  factory $AdminSickApprovalStateCopyWith(AdminSickApprovalState value,
          $Res Function(AdminSickApprovalState) then) =
      _$AdminSickApprovalStateCopyWithImpl<$Res, AdminSickApprovalState>;
  @useResult
  $Res call({List<dynamic>? users});
}

/// @nodoc
class _$AdminSickApprovalStateCopyWithImpl<$Res,
        $Val extends AdminSickApprovalState>
    implements $AdminSickApprovalStateCopyWith<$Res> {
  _$AdminSickApprovalStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AdminSickApprovalState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? users = freezed,
  }) {
    return _then(_value.copyWith(
      users: freezed == users
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AdminSickApprovalStateImplCopyWith<$Res>
    implements $AdminSickApprovalStateCopyWith<$Res> {
  factory _$$AdminSickApprovalStateImplCopyWith(
          _$AdminSickApprovalStateImpl value,
          $Res Function(_$AdminSickApprovalStateImpl) then) =
      __$$AdminSickApprovalStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<dynamic>? users});
}

/// @nodoc
class __$$AdminSickApprovalStateImplCopyWithImpl<$Res>
    extends _$AdminSickApprovalStateCopyWithImpl<$Res,
        _$AdminSickApprovalStateImpl>
    implements _$$AdminSickApprovalStateImplCopyWith<$Res> {
  __$$AdminSickApprovalStateImplCopyWithImpl(
      _$AdminSickApprovalStateImpl _value,
      $Res Function(_$AdminSickApprovalStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AdminSickApprovalState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? users = freezed,
  }) {
    return _then(_$AdminSickApprovalStateImpl(
      users: freezed == users
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
    ));
  }
}

/// @nodoc

class _$AdminSickApprovalStateImpl implements _AdminSickApprovalState {
  _$AdminSickApprovalStateImpl({this.users = null});

  @override
  @JsonKey()
  List<dynamic>? users;

  @override
  String toString() {
    return 'AdminSickApprovalState(users: $users)';
  }

  /// Create a copy of AdminSickApprovalState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AdminSickApprovalStateImplCopyWith<_$AdminSickApprovalStateImpl>
      get copyWith => __$$AdminSickApprovalStateImplCopyWithImpl<
          _$AdminSickApprovalStateImpl>(this, _$identity);
}

abstract class _AdminSickApprovalState implements AdminSickApprovalState {
  factory _AdminSickApprovalState({List<dynamic>? users}) =
      _$AdminSickApprovalStateImpl;

  @override
  List<dynamic>? get users;
  set users(List<dynamic>? value);

  /// Create a copy of AdminSickApprovalState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AdminSickApprovalStateImplCopyWith<_$AdminSickApprovalStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
