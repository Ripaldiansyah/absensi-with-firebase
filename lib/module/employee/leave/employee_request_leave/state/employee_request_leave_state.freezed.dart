// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'employee_request_leave_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$EmployeeRequestLeaveState {
  List<dynamic>? get leaves => throw _privateConstructorUsedError;
  set leaves(List<dynamic>? value) => throw _privateConstructorUsedError;

  /// Create a copy of EmployeeRequestLeaveState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EmployeeRequestLeaveStateCopyWith<EmployeeRequestLeaveState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmployeeRequestLeaveStateCopyWith<$Res> {
  factory $EmployeeRequestLeaveStateCopyWith(EmployeeRequestLeaveState value,
          $Res Function(EmployeeRequestLeaveState) then) =
      _$EmployeeRequestLeaveStateCopyWithImpl<$Res, EmployeeRequestLeaveState>;
  @useResult
  $Res call({List<dynamic>? leaves});
}

/// @nodoc
class _$EmployeeRequestLeaveStateCopyWithImpl<$Res,
        $Val extends EmployeeRequestLeaveState>
    implements $EmployeeRequestLeaveStateCopyWith<$Res> {
  _$EmployeeRequestLeaveStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EmployeeRequestLeaveState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? leaves = freezed,
  }) {
    return _then(_value.copyWith(
      leaves: freezed == leaves
          ? _value.leaves
          : leaves // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EmployeeRequestLeaveStateImplCopyWith<$Res>
    implements $EmployeeRequestLeaveStateCopyWith<$Res> {
  factory _$$EmployeeRequestLeaveStateImplCopyWith(
          _$EmployeeRequestLeaveStateImpl value,
          $Res Function(_$EmployeeRequestLeaveStateImpl) then) =
      __$$EmployeeRequestLeaveStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<dynamic>? leaves});
}

/// @nodoc
class __$$EmployeeRequestLeaveStateImplCopyWithImpl<$Res>
    extends _$EmployeeRequestLeaveStateCopyWithImpl<$Res,
        _$EmployeeRequestLeaveStateImpl>
    implements _$$EmployeeRequestLeaveStateImplCopyWith<$Res> {
  __$$EmployeeRequestLeaveStateImplCopyWithImpl(
      _$EmployeeRequestLeaveStateImpl _value,
      $Res Function(_$EmployeeRequestLeaveStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of EmployeeRequestLeaveState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? leaves = freezed,
  }) {
    return _then(_$EmployeeRequestLeaveStateImpl(
      leaves: freezed == leaves
          ? _value.leaves
          : leaves // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
    ));
  }
}

/// @nodoc

class _$EmployeeRequestLeaveStateImpl implements _EmployeeRequestLeaveState {
  _$EmployeeRequestLeaveStateImpl({this.leaves = null});

  @override
  @JsonKey()
  List<dynamic>? leaves;

  @override
  String toString() {
    return 'EmployeeRequestLeaveState(leaves: $leaves)';
  }

  /// Create a copy of EmployeeRequestLeaveState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EmployeeRequestLeaveStateImplCopyWith<_$EmployeeRequestLeaveStateImpl>
      get copyWith => __$$EmployeeRequestLeaveStateImplCopyWithImpl<
          _$EmployeeRequestLeaveStateImpl>(this, _$identity);
}

abstract class _EmployeeRequestLeaveState implements EmployeeRequestLeaveState {
  factory _EmployeeRequestLeaveState({List<dynamic>? leaves}) =
      _$EmployeeRequestLeaveStateImpl;

  @override
  List<dynamic>? get leaves;
  set leaves(List<dynamic>? value);

  /// Create a copy of EmployeeRequestLeaveState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EmployeeRequestLeaveStateImplCopyWith<_$EmployeeRequestLeaveStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
