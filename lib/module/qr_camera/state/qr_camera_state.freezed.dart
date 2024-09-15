// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'qr_camera_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$QrCameraState {
  int get counter => throw _privateConstructorUsedError;
  set counter(int value) => throw _privateConstructorUsedError;

  /// Create a copy of QrCameraState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QrCameraStateCopyWith<QrCameraState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QrCameraStateCopyWith<$Res> {
  factory $QrCameraStateCopyWith(
          QrCameraState value, $Res Function(QrCameraState) then) =
      _$QrCameraStateCopyWithImpl<$Res, QrCameraState>;
  @useResult
  $Res call({int counter});
}

/// @nodoc
class _$QrCameraStateCopyWithImpl<$Res, $Val extends QrCameraState>
    implements $QrCameraStateCopyWith<$Res> {
  _$QrCameraStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QrCameraState
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
abstract class _$$QrCameraStateImplCopyWith<$Res>
    implements $QrCameraStateCopyWith<$Res> {
  factory _$$QrCameraStateImplCopyWith(
          _$QrCameraStateImpl value, $Res Function(_$QrCameraStateImpl) then) =
      __$$QrCameraStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int counter});
}

/// @nodoc
class __$$QrCameraStateImplCopyWithImpl<$Res>
    extends _$QrCameraStateCopyWithImpl<$Res, _$QrCameraStateImpl>
    implements _$$QrCameraStateImplCopyWith<$Res> {
  __$$QrCameraStateImplCopyWithImpl(
      _$QrCameraStateImpl _value, $Res Function(_$QrCameraStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of QrCameraState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? counter = null,
  }) {
    return _then(_$QrCameraStateImpl(
      counter: null == counter
          ? _value.counter
          : counter // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$QrCameraStateImpl implements _QrCameraState {
  _$QrCameraStateImpl({this.counter = 0});

  @override
  @JsonKey()
  int counter;

  @override
  String toString() {
    return 'QrCameraState(counter: $counter)';
  }

  /// Create a copy of QrCameraState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QrCameraStateImplCopyWith<_$QrCameraStateImpl> get copyWith =>
      __$$QrCameraStateImplCopyWithImpl<_$QrCameraStateImpl>(this, _$identity);
}

abstract class _QrCameraState implements QrCameraState {
  factory _QrCameraState({int counter}) = _$QrCameraStateImpl;

  @override
  int get counter;
  set counter(int value);

  /// Create a copy of QrCameraState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QrCameraStateImplCopyWith<_$QrCameraStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
