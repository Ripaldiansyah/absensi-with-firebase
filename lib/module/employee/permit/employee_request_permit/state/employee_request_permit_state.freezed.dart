// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'employee_request_permit_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$EmployeeRequestPermitState {
  List<dynamic>? get permits => throw _privateConstructorUsedError;
  set permits(List<dynamic>? value) => throw _privateConstructorUsedError;

  /// Create a copy of EmployeeRequestPermitState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EmployeeRequestPermitStateCopyWith<EmployeeRequestPermitState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmployeeRequestPermitStateCopyWith<$Res> {
  factory $EmployeeRequestPermitStateCopyWith(EmployeeRequestPermitState value,
          $Res Function(EmployeeRequestPermitState) then) =
      _$EmployeeRequestPermitStateCopyWithImpl<$Res,
          EmployeeRequestPermitState>;
  @useResult
  $Res call({List<dynamic>? permits});
}

/// @nodoc
class _$EmployeeRequestPermitStateCopyWithImpl<$Res,
        $Val extends EmployeeRequestPermitState>
    implements $EmployeeRequestPermitStateCopyWith<$Res> {
  _$EmployeeRequestPermitStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EmployeeRequestPermitState
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
abstract class _$$EmployeeRequestPermitStateImplCopyWith<$Res>
    implements $EmployeeRequestPermitStateCopyWith<$Res> {
  factory _$$EmployeeRequestPermitStateImplCopyWith(
          _$EmployeeRequestPermitStateImpl value,
          $Res Function(_$EmployeeRequestPermitStateImpl) then) =
      __$$EmployeeRequestPermitStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<dynamic>? permits});
}

/// @nodoc
class __$$EmployeeRequestPermitStateImplCopyWithImpl<$Res>
    extends _$EmployeeRequestPermitStateCopyWithImpl<$Res,
        _$EmployeeRequestPermitStateImpl>
    implements _$$EmployeeRequestPermitStateImplCopyWith<$Res> {
  __$$EmployeeRequestPermitStateImplCopyWithImpl(
      _$EmployeeRequestPermitStateImpl _value,
      $Res Function(_$EmployeeRequestPermitStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of EmployeeRequestPermitState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? permits = freezed,
  }) {
    return _then(_$EmployeeRequestPermitStateImpl(
      permits: freezed == permits
          ? _value.permits
          : permits // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
    ));
  }
}

/// @nodoc

class _$EmployeeRequestPermitStateImpl implements _EmployeeRequestPermitState {
  _$EmployeeRequestPermitStateImpl({this.permits = null});

  @override
  @JsonKey()
  List<dynamic>? permits;

  @override
  String toString() {
    return 'EmployeeRequestPermitState(permits: $permits)';
  }

  /// Create a copy of EmployeeRequestPermitState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EmployeeRequestPermitStateImplCopyWith<_$EmployeeRequestPermitStateImpl>
      get copyWith => __$$EmployeeRequestPermitStateImplCopyWithImpl<
          _$EmployeeRequestPermitStateImpl>(this, _$identity);
}

abstract class _EmployeeRequestPermitState
    implements EmployeeRequestPermitState {
  factory _EmployeeRequestPermitState({List<dynamic>? permits}) =
      _$EmployeeRequestPermitStateImpl;

  @override
  List<dynamic>? get permits;
  set permits(List<dynamic>? value);

  /// Create a copy of EmployeeRequestPermitState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EmployeeRequestPermitStateImplCopyWith<_$EmployeeRequestPermitStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
