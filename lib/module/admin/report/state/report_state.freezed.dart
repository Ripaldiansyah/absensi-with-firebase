// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'report_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ReportState {
  bool? get isMonthly => throw _privateConstructorUsedError;
  set isMonthly(bool? value) => throw _privateConstructorUsedError;
  String? get monthYear => throw _privateConstructorUsedError;
  set monthYear(String? value) => throw _privateConstructorUsedError;

  /// Create a copy of ReportState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReportStateCopyWith<ReportState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReportStateCopyWith<$Res> {
  factory $ReportStateCopyWith(
          ReportState value, $Res Function(ReportState) then) =
      _$ReportStateCopyWithImpl<$Res, ReportState>;
  @useResult
  $Res call({bool? isMonthly, String? monthYear});
}

/// @nodoc
class _$ReportStateCopyWithImpl<$Res, $Val extends ReportState>
    implements $ReportStateCopyWith<$Res> {
  _$ReportStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReportState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isMonthly = freezed,
    Object? monthYear = freezed,
  }) {
    return _then(_value.copyWith(
      isMonthly: freezed == isMonthly
          ? _value.isMonthly
          : isMonthly // ignore: cast_nullable_to_non_nullable
              as bool?,
      monthYear: freezed == monthYear
          ? _value.monthYear
          : monthYear // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReportStateImplCopyWith<$Res>
    implements $ReportStateCopyWith<$Res> {
  factory _$$ReportStateImplCopyWith(
          _$ReportStateImpl value, $Res Function(_$ReportStateImpl) then) =
      __$$ReportStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? isMonthly, String? monthYear});
}

/// @nodoc
class __$$ReportStateImplCopyWithImpl<$Res>
    extends _$ReportStateCopyWithImpl<$Res, _$ReportStateImpl>
    implements _$$ReportStateImplCopyWith<$Res> {
  __$$ReportStateImplCopyWithImpl(
      _$ReportStateImpl _value, $Res Function(_$ReportStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReportState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isMonthly = freezed,
    Object? monthYear = freezed,
  }) {
    return _then(_$ReportStateImpl(
      isMonthly: freezed == isMonthly
          ? _value.isMonthly
          : isMonthly // ignore: cast_nullable_to_non_nullable
              as bool?,
      monthYear: freezed == monthYear
          ? _value.monthYear
          : monthYear // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ReportStateImpl implements _ReportState {
  _$ReportStateImpl({this.isMonthly = null, this.monthYear = null});

  @override
  @JsonKey()
  bool? isMonthly;
  @override
  @JsonKey()
  String? monthYear;

  @override
  String toString() {
    return 'ReportState(isMonthly: $isMonthly, monthYear: $monthYear)';
  }

  /// Create a copy of ReportState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReportStateImplCopyWith<_$ReportStateImpl> get copyWith =>
      __$$ReportStateImplCopyWithImpl<_$ReportStateImpl>(this, _$identity);
}

abstract class _ReportState implements ReportState {
  factory _ReportState({bool? isMonthly, String? monthYear}) =
      _$ReportStateImpl;

  @override
  bool? get isMonthly;
  set isMonthly(bool? value);
  @override
  String? get monthYear;
  set monthYear(String? value);

  /// Create a copy of ReportState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReportStateImplCopyWith<_$ReportStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
