// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'admin_sick_list_by_user_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AdminSickListByUserState {
  List<dynamic>? get sicks => throw _privateConstructorUsedError;
  set sicks(List<dynamic>? value) => throw _privateConstructorUsedError;

  /// Create a copy of AdminSickListByUserState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AdminSickListByUserStateCopyWith<AdminSickListByUserState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdminSickListByUserStateCopyWith<$Res> {
  factory $AdminSickListByUserStateCopyWith(AdminSickListByUserState value,
          $Res Function(AdminSickListByUserState) then) =
      _$AdminSickListByUserStateCopyWithImpl<$Res, AdminSickListByUserState>;
  @useResult
  $Res call({List<dynamic>? sicks});
}

/// @nodoc
class _$AdminSickListByUserStateCopyWithImpl<$Res,
        $Val extends AdminSickListByUserState>
    implements $AdminSickListByUserStateCopyWith<$Res> {
  _$AdminSickListByUserStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AdminSickListByUserState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sicks = freezed,
  }) {
    return _then(_value.copyWith(
      sicks: freezed == sicks
          ? _value.sicks
          : sicks // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AdminSickListByUserStateImplCopyWith<$Res>
    implements $AdminSickListByUserStateCopyWith<$Res> {
  factory _$$AdminSickListByUserStateImplCopyWith(
          _$AdminSickListByUserStateImpl value,
          $Res Function(_$AdminSickListByUserStateImpl) then) =
      __$$AdminSickListByUserStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<dynamic>? sicks});
}

/// @nodoc
class __$$AdminSickListByUserStateImplCopyWithImpl<$Res>
    extends _$AdminSickListByUserStateCopyWithImpl<$Res,
        _$AdminSickListByUserStateImpl>
    implements _$$AdminSickListByUserStateImplCopyWith<$Res> {
  __$$AdminSickListByUserStateImplCopyWithImpl(
      _$AdminSickListByUserStateImpl _value,
      $Res Function(_$AdminSickListByUserStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AdminSickListByUserState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sicks = freezed,
  }) {
    return _then(_$AdminSickListByUserStateImpl(
      sicks: freezed == sicks
          ? _value.sicks
          : sicks // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
    ));
  }
}

/// @nodoc

class _$AdminSickListByUserStateImpl implements _AdminSickListByUserState {
  _$AdminSickListByUserStateImpl({this.sicks = null});

  @override
  @JsonKey()
  List<dynamic>? sicks;

  @override
  String toString() {
    return 'AdminSickListByUserState(sicks: $sicks)';
  }

  /// Create a copy of AdminSickListByUserState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AdminSickListByUserStateImplCopyWith<_$AdminSickListByUserStateImpl>
      get copyWith => __$$AdminSickListByUserStateImplCopyWithImpl<
          _$AdminSickListByUserStateImpl>(this, _$identity);
}

abstract class _AdminSickListByUserState implements AdminSickListByUserState {
  factory _AdminSickListByUserState({List<dynamic>? sicks}) =
      _$AdminSickListByUserStateImpl;

  @override
  List<dynamic>? get sicks;
  set sicks(List<dynamic>? value);

  /// Create a copy of AdminSickListByUserState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AdminSickListByUserStateImplCopyWith<_$AdminSickListByUserStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
