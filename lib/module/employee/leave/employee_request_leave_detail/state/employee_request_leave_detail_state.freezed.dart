// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'employee_request_leave_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$EmployeeRequestLeaveDetailState {
  int get counter => throw _privateConstructorUsedError;
  set counter(int value) => throw _privateConstructorUsedError;

  /// Create a copy of EmployeeRequestLeaveDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EmployeeRequestLeaveDetailStateCopyWith<EmployeeRequestLeaveDetailState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmployeeRequestLeaveDetailStateCopyWith<$Res> {
  factory $EmployeeRequestLeaveDetailStateCopyWith(
          EmployeeRequestLeaveDetailState value,
          $Res Function(EmployeeRequestLeaveDetailState) then) =
      _$EmployeeRequestLeaveDetailStateCopyWithImpl<$Res,
          EmployeeRequestLeaveDetailState>;
  @useResult
  $Res call({int counter});
}

/// @nodoc
class _$EmployeeRequestLeaveDetailStateCopyWithImpl<$Res,
        $Val extends EmployeeRequestLeaveDetailState>
    implements $EmployeeRequestLeaveDetailStateCopyWith<$Res> {
  _$EmployeeRequestLeaveDetailStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EmployeeRequestLeaveDetailState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? counter = null,
  }) {
    return _then(_value.copyWith(
      counter: null == counter
          ? _value.counter
          : counter // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EmployeeRequestLeaveDetailStateImplCopyWith<$Res>
    implements $EmployeeRequestLeaveDetailStateCopyWith<$Res> {
  factory _$$EmployeeRequestLeaveDetailStateImplCopyWith(
          _$EmployeeRequestLeaveDetailStateImpl value,
          $Res Function(_$EmployeeRequestLeaveDetailStateImpl) then) =
      __$$EmployeeRequestLeaveDetailStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int counter});
}

/// @nodoc
class __$$EmployeeRequestLeaveDetailStateImplCopyWithImpl<$Res>
    extends _$EmployeeRequestLeaveDetailStateCopyWithImpl<$Res,
        _$EmployeeRequestLeaveDetailStateImpl>
    implements _$$EmployeeRequestLeaveDetailStateImplCopyWith<$Res> {
  __$$EmployeeRequestLeaveDetailStateImplCopyWithImpl(
      _$EmployeeRequestLeaveDetailStateImpl _value,
      $Res Function(_$EmployeeRequestLeaveDetailStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of EmployeeRequestLeaveDetailState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? counter = null,
  }) {
    return _then(_$EmployeeRequestLeaveDetailStateImpl(
      counter: null == counter
          ? _value.counter
          : counter // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$EmployeeRequestLeaveDetailStateImpl
    implements _EmployeeRequestLeaveDetailState {
  _$EmployeeRequestLeaveDetailStateImpl({this.counter = 0});

  @override
  @JsonKey()
  int counter;

  @override
  String toString() {
    return 'EmployeeRequestLeaveDetailState(counter: $counter)';
  }

  /// Create a copy of EmployeeRequestLeaveDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EmployeeRequestLeaveDetailStateImplCopyWith<
          _$EmployeeRequestLeaveDetailStateImpl>
      get copyWith => __$$EmployeeRequestLeaveDetailStateImplCopyWithImpl<
          _$EmployeeRequestLeaveDetailStateImpl>(this, _$identity);
}

abstract class _EmployeeRequestLeaveDetailState
    implements EmployeeRequestLeaveDetailState {
  factory _EmployeeRequestLeaveDetailState({int counter}) =
      _$EmployeeRequestLeaveDetailStateImpl;

  @override
  int get counter;
  set counter(int value);

  /// Create a copy of EmployeeRequestLeaveDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EmployeeRequestLeaveDetailStateImplCopyWith<
          _$EmployeeRequestLeaveDetailStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
