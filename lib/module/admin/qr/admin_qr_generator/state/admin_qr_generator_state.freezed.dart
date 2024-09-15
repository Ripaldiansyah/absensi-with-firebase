// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'admin_qr_generator_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AdminQrGeneratorState {
  int get counter => throw _privateConstructorUsedError;
  set counter(int value) => throw _privateConstructorUsedError;

  /// Create a copy of AdminQrGeneratorState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AdminQrGeneratorStateCopyWith<AdminQrGeneratorState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdminQrGeneratorStateCopyWith<$Res> {
  factory $AdminQrGeneratorStateCopyWith(AdminQrGeneratorState value,
          $Res Function(AdminQrGeneratorState) then) =
      _$AdminQrGeneratorStateCopyWithImpl<$Res, AdminQrGeneratorState>;
  @useResult
  $Res call({int counter});
}

/// @nodoc
class _$AdminQrGeneratorStateCopyWithImpl<$Res,
        $Val extends AdminQrGeneratorState>
    implements $AdminQrGeneratorStateCopyWith<$Res> {
  _$AdminQrGeneratorStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AdminQrGeneratorState
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
abstract class _$$AdminQrGeneratorStateImplCopyWith<$Res>
    implements $AdminQrGeneratorStateCopyWith<$Res> {
  factory _$$AdminQrGeneratorStateImplCopyWith(
          _$AdminQrGeneratorStateImpl value,
          $Res Function(_$AdminQrGeneratorStateImpl) then) =
      __$$AdminQrGeneratorStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int counter});
}

/// @nodoc
class __$$AdminQrGeneratorStateImplCopyWithImpl<$Res>
    extends _$AdminQrGeneratorStateCopyWithImpl<$Res,
        _$AdminQrGeneratorStateImpl>
    implements _$$AdminQrGeneratorStateImplCopyWith<$Res> {
  __$$AdminQrGeneratorStateImplCopyWithImpl(_$AdminQrGeneratorStateImpl _value,
      $Res Function(_$AdminQrGeneratorStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AdminQrGeneratorState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? counter = null,
  }) {
    return _then(_$AdminQrGeneratorStateImpl(
      counter: null == counter
          ? _value.counter
          : counter // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$AdminQrGeneratorStateImpl implements _AdminQrGeneratorState {
  _$AdminQrGeneratorStateImpl({this.counter = 0});

  @override
  @JsonKey()
  int counter;

  @override
  String toString() {
    return 'AdminQrGeneratorState(counter: $counter)';
  }

  /// Create a copy of AdminQrGeneratorState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AdminQrGeneratorStateImplCopyWith<_$AdminQrGeneratorStateImpl>
      get copyWith => __$$AdminQrGeneratorStateImplCopyWithImpl<
          _$AdminQrGeneratorStateImpl>(this, _$identity);
}

abstract class _AdminQrGeneratorState implements AdminQrGeneratorState {
  factory _AdminQrGeneratorState({int counter}) = _$AdminQrGeneratorStateImpl;

  @override
  int get counter;
  set counter(int value);

  /// Create a copy of AdminQrGeneratorState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AdminQrGeneratorStateImplCopyWith<_$AdminQrGeneratorStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
