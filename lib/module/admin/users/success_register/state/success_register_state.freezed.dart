// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'success_register_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SuccessRegisterState {
  int get counter => throw _privateConstructorUsedError;
  set counter(int value) => throw _privateConstructorUsedError;

  /// Create a copy of SuccessRegisterState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SuccessRegisterStateCopyWith<SuccessRegisterState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SuccessRegisterStateCopyWith<$Res> {
  factory $SuccessRegisterStateCopyWith(SuccessRegisterState value,
          $Res Function(SuccessRegisterState) then) =
      _$SuccessRegisterStateCopyWithImpl<$Res, SuccessRegisterState>;
  @useResult
  $Res call({int counter});
}

/// @nodoc
class _$SuccessRegisterStateCopyWithImpl<$Res,
        $Val extends SuccessRegisterState>
    implements $SuccessRegisterStateCopyWith<$Res> {
  _$SuccessRegisterStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SuccessRegisterState
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
abstract class _$$SuccessRegisterStateImplCopyWith<$Res>
    implements $SuccessRegisterStateCopyWith<$Res> {
  factory _$$SuccessRegisterStateImplCopyWith(_$SuccessRegisterStateImpl value,
          $Res Function(_$SuccessRegisterStateImpl) then) =
      __$$SuccessRegisterStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int counter});
}

/// @nodoc
class __$$SuccessRegisterStateImplCopyWithImpl<$Res>
    extends _$SuccessRegisterStateCopyWithImpl<$Res, _$SuccessRegisterStateImpl>
    implements _$$SuccessRegisterStateImplCopyWith<$Res> {
  __$$SuccessRegisterStateImplCopyWithImpl(_$SuccessRegisterStateImpl _value,
      $Res Function(_$SuccessRegisterStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SuccessRegisterState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? counter = null,
  }) {
    return _then(_$SuccessRegisterStateImpl(
      counter: null == counter
          ? _value.counter
          : counter // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$SuccessRegisterStateImpl implements _SuccessRegisterState {
  _$SuccessRegisterStateImpl({this.counter = 0});

  @override
  @JsonKey()
  int counter;

  @override
  String toString() {
    return 'SuccessRegisterState(counter: $counter)';
  }

  /// Create a copy of SuccessRegisterState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessRegisterStateImplCopyWith<_$SuccessRegisterStateImpl>
      get copyWith =>
          __$$SuccessRegisterStateImplCopyWithImpl<_$SuccessRegisterStateImpl>(
              this, _$identity);
}

abstract class _SuccessRegisterState implements SuccessRegisterState {
  factory _SuccessRegisterState({int counter}) = _$SuccessRegisterStateImpl;

  @override
  int get counter;
  set counter(int value);

  /// Create a copy of SuccessRegisterState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SuccessRegisterStateImplCopyWith<_$SuccessRegisterStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
