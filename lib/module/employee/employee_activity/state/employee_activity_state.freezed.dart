// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'employee_activity_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$EmployeeActivityState {
  List<dynamic>? get history => throw _privateConstructorUsedError;
  set history(List<dynamic>? value) => throw _privateConstructorUsedError;

  /// Create a copy of EmployeeActivityState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EmployeeActivityStateCopyWith<EmployeeActivityState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmployeeActivityStateCopyWith<$Res> {
  factory $EmployeeActivityStateCopyWith(EmployeeActivityState value,
          $Res Function(EmployeeActivityState) then) =
      _$EmployeeActivityStateCopyWithImpl<$Res, EmployeeActivityState>;
  @useResult
  $Res call({List<dynamic>? history});
}

/// @nodoc
class _$EmployeeActivityStateCopyWithImpl<$Res,
        $Val extends EmployeeActivityState>
    implements $EmployeeActivityStateCopyWith<$Res> {
  _$EmployeeActivityStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EmployeeActivityState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? history = freezed,
  }) {
    return _then(_value.copyWith(
      history: freezed == history
          ? _value.history
          : history // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EmployeeActivityStateImplCopyWith<$Res>
    implements $EmployeeActivityStateCopyWith<$Res> {
  factory _$$EmployeeActivityStateImplCopyWith(
          _$EmployeeActivityStateImpl value,
          $Res Function(_$EmployeeActivityStateImpl) then) =
      __$$EmployeeActivityStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<dynamic>? history});
}

/// @nodoc
class __$$EmployeeActivityStateImplCopyWithImpl<$Res>
    extends _$EmployeeActivityStateCopyWithImpl<$Res,
        _$EmployeeActivityStateImpl>
    implements _$$EmployeeActivityStateImplCopyWith<$Res> {
  __$$EmployeeActivityStateImplCopyWithImpl(_$EmployeeActivityStateImpl _value,
      $Res Function(_$EmployeeActivityStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of EmployeeActivityState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? history = freezed,
  }) {
    return _then(_$EmployeeActivityStateImpl(
      history: freezed == history
          ? _value.history
          : history // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
    ));
  }
}

/// @nodoc

class _$EmployeeActivityStateImpl implements _EmployeeActivityState {
  _$EmployeeActivityStateImpl({this.history = null});

  @override
  @JsonKey()
  List<dynamic>? history;

  @override
  String toString() {
    return 'EmployeeActivityState(history: $history)';
  }

  /// Create a copy of EmployeeActivityState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EmployeeActivityStateImplCopyWith<_$EmployeeActivityStateImpl>
      get copyWith => __$$EmployeeActivityStateImplCopyWithImpl<
          _$EmployeeActivityStateImpl>(this, _$identity);
}

abstract class _EmployeeActivityState implements EmployeeActivityState {
  factory _EmployeeActivityState({List<dynamic>? history}) =
      _$EmployeeActivityStateImpl;

  @override
  List<dynamic>? get history;
  set history(List<dynamic>? value);

  /// Create a copy of EmployeeActivityState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EmployeeActivityStateImplCopyWith<_$EmployeeActivityStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
