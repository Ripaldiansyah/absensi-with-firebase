// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'employee_request_sick_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$EmployeeRequestSickState {
  List<dynamic>? get sicks => throw _privateConstructorUsedError;
  set sicks(List<dynamic>? value) => throw _privateConstructorUsedError;

  /// Create a copy of EmployeeRequestSickState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EmployeeRequestSickStateCopyWith<EmployeeRequestSickState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmployeeRequestSickStateCopyWith<$Res> {
  factory $EmployeeRequestSickStateCopyWith(EmployeeRequestSickState value,
          $Res Function(EmployeeRequestSickState) then) =
      _$EmployeeRequestSickStateCopyWithImpl<$Res, EmployeeRequestSickState>;
  @useResult
  $Res call({List<dynamic>? sicks});
}

/// @nodoc
class _$EmployeeRequestSickStateCopyWithImpl<$Res,
        $Val extends EmployeeRequestSickState>
    implements $EmployeeRequestSickStateCopyWith<$Res> {
  _$EmployeeRequestSickStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EmployeeRequestSickState
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
abstract class _$$EmployeeRequestSickStateImplCopyWith<$Res>
    implements $EmployeeRequestSickStateCopyWith<$Res> {
  factory _$$EmployeeRequestSickStateImplCopyWith(
          _$EmployeeRequestSickStateImpl value,
          $Res Function(_$EmployeeRequestSickStateImpl) then) =
      __$$EmployeeRequestSickStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<dynamic>? sicks});
}

/// @nodoc
class __$$EmployeeRequestSickStateImplCopyWithImpl<$Res>
    extends _$EmployeeRequestSickStateCopyWithImpl<$Res,
        _$EmployeeRequestSickStateImpl>
    implements _$$EmployeeRequestSickStateImplCopyWith<$Res> {
  __$$EmployeeRequestSickStateImplCopyWithImpl(
      _$EmployeeRequestSickStateImpl _value,
      $Res Function(_$EmployeeRequestSickStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of EmployeeRequestSickState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sicks = freezed,
  }) {
    return _then(_$EmployeeRequestSickStateImpl(
      sicks: freezed == sicks
          ? _value.sicks
          : sicks // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
    ));
  }
}

/// @nodoc

class _$EmployeeRequestSickStateImpl implements _EmployeeRequestSickState {
  _$EmployeeRequestSickStateImpl({this.sicks = null});

  @override
  @JsonKey()
  List<dynamic>? sicks;

  @override
  String toString() {
    return 'EmployeeRequestSickState(sicks: $sicks)';
  }

  /// Create a copy of EmployeeRequestSickState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EmployeeRequestSickStateImplCopyWith<_$EmployeeRequestSickStateImpl>
      get copyWith => __$$EmployeeRequestSickStateImplCopyWithImpl<
          _$EmployeeRequestSickStateImpl>(this, _$identity);
}

abstract class _EmployeeRequestSickState implements EmployeeRequestSickState {
  factory _EmployeeRequestSickState({List<dynamic>? sicks}) =
      _$EmployeeRequestSickStateImpl;

  @override
  List<dynamic>? get sicks;
  set sicks(List<dynamic>? value);

  /// Create a copy of EmployeeRequestSickState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EmployeeRequestSickStateImplCopyWith<_$EmployeeRequestSickStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
