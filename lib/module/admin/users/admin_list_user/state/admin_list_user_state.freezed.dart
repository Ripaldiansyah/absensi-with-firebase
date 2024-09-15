// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'admin_list_user_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AdminListUserState {
  List<dynamic>? get users => throw _privateConstructorUsedError;
  set users(List<dynamic>? value) => throw _privateConstructorUsedError;

  /// Create a copy of AdminListUserState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AdminListUserStateCopyWith<AdminListUserState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdminListUserStateCopyWith<$Res> {
  factory $AdminListUserStateCopyWith(
          AdminListUserState value, $Res Function(AdminListUserState) then) =
      _$AdminListUserStateCopyWithImpl<$Res, AdminListUserState>;
  @useResult
  $Res call({List<dynamic>? users});
}

/// @nodoc
class _$AdminListUserStateCopyWithImpl<$Res, $Val extends AdminListUserState>
    implements $AdminListUserStateCopyWith<$Res> {
  _$AdminListUserStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AdminListUserState
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
abstract class _$$AdminListUserStateImplCopyWith<$Res>
    implements $AdminListUserStateCopyWith<$Res> {
  factory _$$AdminListUserStateImplCopyWith(_$AdminListUserStateImpl value,
          $Res Function(_$AdminListUserStateImpl) then) =
      __$$AdminListUserStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<dynamic>? users});
}

/// @nodoc
class __$$AdminListUserStateImplCopyWithImpl<$Res>
    extends _$AdminListUserStateCopyWithImpl<$Res, _$AdminListUserStateImpl>
    implements _$$AdminListUserStateImplCopyWith<$Res> {
  __$$AdminListUserStateImplCopyWithImpl(_$AdminListUserStateImpl _value,
      $Res Function(_$AdminListUserStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AdminListUserState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? users = freezed,
  }) {
    return _then(_$AdminListUserStateImpl(
      users: freezed == users
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
    ));
  }
}

/// @nodoc

class _$AdminListUserStateImpl implements _AdminListUserState {
  _$AdminListUserStateImpl({this.users = null});

  @override
  @JsonKey()
  List<dynamic>? users;

  @override
  String toString() {
    return 'AdminListUserState(users: $users)';
  }

  /// Create a copy of AdminListUserState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AdminListUserStateImplCopyWith<_$AdminListUserStateImpl> get copyWith =>
      __$$AdminListUserStateImplCopyWithImpl<_$AdminListUserStateImpl>(
          this, _$identity);
}

abstract class _AdminListUserState implements AdminListUserState {
  factory _AdminListUserState({List<dynamic>? users}) =
      _$AdminListUserStateImpl;

  @override
  List<dynamic>? get users;
  set users(List<dynamic>? value);

  /// Create a copy of AdminListUserState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AdminListUserStateImplCopyWith<_$AdminListUserStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
