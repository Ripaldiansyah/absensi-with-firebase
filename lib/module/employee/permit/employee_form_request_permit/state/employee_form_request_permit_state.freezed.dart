// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'employee_form_request_permit_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$EmployeeFormRequestPermitState {
  String? get title => throw _privateConstructorUsedError;
  set title(String? value) => throw _privateConstructorUsedError;
  DateTime? get permitDate => throw _privateConstructorUsedError;
  set permitDate(DateTime? value) => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  set description(String? value) => throw _privateConstructorUsedError;

  /// Create a copy of EmployeeFormRequestPermitState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EmployeeFormRequestPermitStateCopyWith<EmployeeFormRequestPermitState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmployeeFormRequestPermitStateCopyWith<$Res> {
  factory $EmployeeFormRequestPermitStateCopyWith(
          EmployeeFormRequestPermitState value,
          $Res Function(EmployeeFormRequestPermitState) then) =
      _$EmployeeFormRequestPermitStateCopyWithImpl<$Res,
          EmployeeFormRequestPermitState>;
  @useResult
  $Res call({String? title, DateTime? permitDate, String? description});
}

/// @nodoc
class _$EmployeeFormRequestPermitStateCopyWithImpl<$Res,
        $Val extends EmployeeFormRequestPermitState>
    implements $EmployeeFormRequestPermitStateCopyWith<$Res> {
  _$EmployeeFormRequestPermitStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EmployeeFormRequestPermitState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? permitDate = freezed,
    Object? description = freezed,
  }) {
    return _then(_value.copyWith(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      permitDate: freezed == permitDate
          ? _value.permitDate
          : permitDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EmployeeFormRequestPermitStateImplCopyWith<$Res>
    implements $EmployeeFormRequestPermitStateCopyWith<$Res> {
  factory _$$EmployeeFormRequestPermitStateImplCopyWith(
          _$EmployeeFormRequestPermitStateImpl value,
          $Res Function(_$EmployeeFormRequestPermitStateImpl) then) =
      __$$EmployeeFormRequestPermitStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? title, DateTime? permitDate, String? description});
}

/// @nodoc
class __$$EmployeeFormRequestPermitStateImplCopyWithImpl<$Res>
    extends _$EmployeeFormRequestPermitStateCopyWithImpl<$Res,
        _$EmployeeFormRequestPermitStateImpl>
    implements _$$EmployeeFormRequestPermitStateImplCopyWith<$Res> {
  __$$EmployeeFormRequestPermitStateImplCopyWithImpl(
      _$EmployeeFormRequestPermitStateImpl _value,
      $Res Function(_$EmployeeFormRequestPermitStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of EmployeeFormRequestPermitState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? permitDate = freezed,
    Object? description = freezed,
  }) {
    return _then(_$EmployeeFormRequestPermitStateImpl(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      permitDate: freezed == permitDate
          ? _value.permitDate
          : permitDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$EmployeeFormRequestPermitStateImpl
    implements _EmployeeFormRequestPermitState {
  _$EmployeeFormRequestPermitStateImpl(
      {this.title = null, this.permitDate = null, this.description = null});

  @override
  @JsonKey()
  String? title;
  @override
  @JsonKey()
  DateTime? permitDate;
  @override
  @JsonKey()
  String? description;

  @override
  String toString() {
    return 'EmployeeFormRequestPermitState(title: $title, permitDate: $permitDate, description: $description)';
  }

  /// Create a copy of EmployeeFormRequestPermitState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EmployeeFormRequestPermitStateImplCopyWith<
          _$EmployeeFormRequestPermitStateImpl>
      get copyWith => __$$EmployeeFormRequestPermitStateImplCopyWithImpl<
          _$EmployeeFormRequestPermitStateImpl>(this, _$identity);
}

abstract class _EmployeeFormRequestPermitState
    implements EmployeeFormRequestPermitState {
  factory _EmployeeFormRequestPermitState(
      {String? title,
      DateTime? permitDate,
      String? description}) = _$EmployeeFormRequestPermitStateImpl;

  @override
  String? get title;
  set title(String? value);
  @override
  DateTime? get permitDate;
  set permitDate(DateTime? value);
  @override
  String? get description;
  set description(String? value);

  /// Create a copy of EmployeeFormRequestPermitState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EmployeeFormRequestPermitStateImplCopyWith<
          _$EmployeeFormRequestPermitStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
