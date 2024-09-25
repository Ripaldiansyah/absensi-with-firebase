// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'admin_presence_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AdminPresenceState {
  List<dynamic>? get userPresence => throw _privateConstructorUsedError;
  set userPresence(List<dynamic>? value) => throw _privateConstructorUsedError;
  List<Map<String, dynamic>>? get dateMonthYear =>
      throw _privateConstructorUsedError;
  set dateMonthYear(List<Map<String, dynamic>>? value) =>
      throw _privateConstructorUsedError;

  /// Create a copy of AdminPresenceState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AdminPresenceStateCopyWith<AdminPresenceState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdminPresenceStateCopyWith<$Res> {
  factory $AdminPresenceStateCopyWith(
          AdminPresenceState value, $Res Function(AdminPresenceState) then) =
      _$AdminPresenceStateCopyWithImpl<$Res, AdminPresenceState>;
  @useResult
  $Res call(
      {List<dynamic>? userPresence, List<Map<String, dynamic>>? dateMonthYear});
}

/// @nodoc
class _$AdminPresenceStateCopyWithImpl<$Res, $Val extends AdminPresenceState>
    implements $AdminPresenceStateCopyWith<$Res> {
  _$AdminPresenceStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AdminPresenceState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userPresence = freezed,
    Object? dateMonthYear = freezed,
  }) {
    return _then(_value.copyWith(
      userPresence: freezed == userPresence
          ? _value.userPresence
          : userPresence // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      dateMonthYear: freezed == dateMonthYear
          ? _value.dateMonthYear
          : dateMonthYear // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AdminPresenceStateImplCopyWith<$Res>
    implements $AdminPresenceStateCopyWith<$Res> {
  factory _$$AdminPresenceStateImplCopyWith(_$AdminPresenceStateImpl value,
          $Res Function(_$AdminPresenceStateImpl) then) =
      __$$AdminPresenceStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<dynamic>? userPresence, List<Map<String, dynamic>>? dateMonthYear});
}

/// @nodoc
class __$$AdminPresenceStateImplCopyWithImpl<$Res>
    extends _$AdminPresenceStateCopyWithImpl<$Res, _$AdminPresenceStateImpl>
    implements _$$AdminPresenceStateImplCopyWith<$Res> {
  __$$AdminPresenceStateImplCopyWithImpl(_$AdminPresenceStateImpl _value,
      $Res Function(_$AdminPresenceStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AdminPresenceState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userPresence = freezed,
    Object? dateMonthYear = freezed,
  }) {
    return _then(_$AdminPresenceStateImpl(
      userPresence: freezed == userPresence
          ? _value.userPresence
          : userPresence // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      dateMonthYear: freezed == dateMonthYear
          ? _value.dateMonthYear
          : dateMonthYear // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>?,
    ));
  }
}

/// @nodoc

class _$AdminPresenceStateImpl implements _AdminPresenceState {
  _$AdminPresenceStateImpl(
      {this.userPresence = null, this.dateMonthYear = null});

  @override
  @JsonKey()
  List<dynamic>? userPresence;
  @override
  @JsonKey()
  List<Map<String, dynamic>>? dateMonthYear;

  @override
  String toString() {
    return 'AdminPresenceState(userPresence: $userPresence, dateMonthYear: $dateMonthYear)';
  }

  /// Create a copy of AdminPresenceState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AdminPresenceStateImplCopyWith<_$AdminPresenceStateImpl> get copyWith =>
      __$$AdminPresenceStateImplCopyWithImpl<_$AdminPresenceStateImpl>(
          this, _$identity);
}

abstract class _AdminPresenceState implements AdminPresenceState {
  factory _AdminPresenceState(
      {List<dynamic>? userPresence,
      List<Map<String, dynamic>>? dateMonthYear}) = _$AdminPresenceStateImpl;

  @override
  List<dynamic>? get userPresence;
  set userPresence(List<dynamic>? value);
  @override
  List<Map<String, dynamic>>? get dateMonthYear;
  set dateMonthYear(List<Map<String, dynamic>>? value);

  /// Create a copy of AdminPresenceState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AdminPresenceStateImplCopyWith<_$AdminPresenceStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
