// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'admin_permit_list_by_user_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AdminPermitListByUserState {
  List<dynamic>? get permits => throw _privateConstructorUsedError;
  set permits(List<dynamic>? value) => throw _privateConstructorUsedError;

  /// Create a copy of AdminPermitListByUserState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AdminPermitListByUserStateCopyWith<AdminPermitListByUserState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdminPermitListByUserStateCopyWith<$Res> {
  factory $AdminPermitListByUserStateCopyWith(AdminPermitListByUserState value,
          $Res Function(AdminPermitListByUserState) then) =
      _$AdminPermitListByUserStateCopyWithImpl<$Res,
          AdminPermitListByUserState>;
  @useResult
  $Res call({List<dynamic>? permits});
}

/// @nodoc
class _$AdminPermitListByUserStateCopyWithImpl<$Res,
        $Val extends AdminPermitListByUserState>
    implements $AdminPermitListByUserStateCopyWith<$Res> {
  _$AdminPermitListByUserStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AdminPermitListByUserState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? permits = freezed,
  }) {
    return _then(_value.copyWith(
      permits: freezed == permits
          ? _value.permits
          : permits // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AdminPermitListByUserStateImplCopyWith<$Res>
    implements $AdminPermitListByUserStateCopyWith<$Res> {
  factory _$$AdminPermitListByUserStateImplCopyWith(
          _$AdminPermitListByUserStateImpl value,
          $Res Function(_$AdminPermitListByUserStateImpl) then) =
      __$$AdminPermitListByUserStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<dynamic>? permits});
}

/// @nodoc
class __$$AdminPermitListByUserStateImplCopyWithImpl<$Res>
    extends _$AdminPermitListByUserStateCopyWithImpl<$Res,
        _$AdminPermitListByUserStateImpl>
    implements _$$AdminPermitListByUserStateImplCopyWith<$Res> {
  __$$AdminPermitListByUserStateImplCopyWithImpl(
      _$AdminPermitListByUserStateImpl _value,
      $Res Function(_$AdminPermitListByUserStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AdminPermitListByUserState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? permits = freezed,
  }) {
    return _then(_$AdminPermitListByUserStateImpl(
      permits: freezed == permits
          ? _value.permits
          : permits // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
    ));
  }
}

/// @nodoc

class _$AdminPermitListByUserStateImpl implements _AdminPermitListByUserState {
  _$AdminPermitListByUserStateImpl({this.permits = null});

  @override
  @JsonKey()
  List<dynamic>? permits;

  @override
  String toString() {
    return 'AdminPermitListByUserState(permits: $permits)';
  }

  /// Create a copy of AdminPermitListByUserState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AdminPermitListByUserStateImplCopyWith<_$AdminPermitListByUserStateImpl>
      get copyWith => __$$AdminPermitListByUserStateImplCopyWithImpl<
          _$AdminPermitListByUserStateImpl>(this, _$identity);
}

abstract class _AdminPermitListByUserState
    implements AdminPermitListByUserState {
  factory _AdminPermitListByUserState({List<dynamic>? permits}) =
      _$AdminPermitListByUserStateImpl;

  @override
  List<dynamic>? get permits;
  set permits(List<dynamic>? value);

  /// Create a copy of AdminPermitListByUserState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AdminPermitListByUserStateImplCopyWith<_$AdminPermitListByUserStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
