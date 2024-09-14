// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'admin_leaves_approval_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AdminLeavesApprovalState {
  List<dynamic>? get users => throw _privateConstructorUsedError;
  set users(List<dynamic>? value) => throw _privateConstructorUsedError;

  /// Create a copy of AdminLeavesApprovalState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AdminLeavesApprovalStateCopyWith<AdminLeavesApprovalState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdminLeavesApprovalStateCopyWith<$Res> {
  factory $AdminLeavesApprovalStateCopyWith(AdminLeavesApprovalState value,
          $Res Function(AdminLeavesApprovalState) then) =
      _$AdminLeavesApprovalStateCopyWithImpl<$Res, AdminLeavesApprovalState>;
  @useResult
  $Res call({List<dynamic>? users});
}

/// @nodoc
class _$AdminLeavesApprovalStateCopyWithImpl<$Res,
        $Val extends AdminLeavesApprovalState>
    implements $AdminLeavesApprovalStateCopyWith<$Res> {
  _$AdminLeavesApprovalStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AdminLeavesApprovalState
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
abstract class _$$AdminLeavesApprovalStateImplCopyWith<$Res>
    implements $AdminLeavesApprovalStateCopyWith<$Res> {
  factory _$$AdminLeavesApprovalStateImplCopyWith(
          _$AdminLeavesApprovalStateImpl value,
          $Res Function(_$AdminLeavesApprovalStateImpl) then) =
      __$$AdminLeavesApprovalStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<dynamic>? users});
}

/// @nodoc
class __$$AdminLeavesApprovalStateImplCopyWithImpl<$Res>
    extends _$AdminLeavesApprovalStateCopyWithImpl<$Res,
        _$AdminLeavesApprovalStateImpl>
    implements _$$AdminLeavesApprovalStateImplCopyWith<$Res> {
  __$$AdminLeavesApprovalStateImplCopyWithImpl(
      _$AdminLeavesApprovalStateImpl _value,
      $Res Function(_$AdminLeavesApprovalStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AdminLeavesApprovalState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? users = freezed,
  }) {
    return _then(_$AdminLeavesApprovalStateImpl(
      users: freezed == users
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
    ));
  }
}

/// @nodoc

class _$AdminLeavesApprovalStateImpl implements _AdminLeavesApprovalState {
  _$AdminLeavesApprovalStateImpl({this.users = null});

  @override
  @JsonKey()
  List<dynamic>? users;

  @override
  String toString() {
    return 'AdminLeavesApprovalState(users: $users)';
  }

  /// Create a copy of AdminLeavesApprovalState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AdminLeavesApprovalStateImplCopyWith<_$AdminLeavesApprovalStateImpl>
      get copyWith => __$$AdminLeavesApprovalStateImplCopyWithImpl<
          _$AdminLeavesApprovalStateImpl>(this, _$identity);
}

abstract class _AdminLeavesApprovalState implements AdminLeavesApprovalState {
  factory _AdminLeavesApprovalState({List<dynamic>? users}) =
      _$AdminLeavesApprovalStateImpl;

  @override
  List<dynamic>? get users;
  set users(List<dynamic>? value);

  /// Create a copy of AdminLeavesApprovalState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AdminLeavesApprovalStateImplCopyWith<_$AdminLeavesApprovalStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
