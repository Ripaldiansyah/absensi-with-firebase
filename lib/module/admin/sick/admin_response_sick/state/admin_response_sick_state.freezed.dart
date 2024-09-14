// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'admin_response_sick_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AdminResponseSickState {
  int get counter => throw _privateConstructorUsedError;
  set counter(int value) => throw _privateConstructorUsedError;

  /// Create a copy of AdminResponseSickState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AdminResponseSickStateCopyWith<AdminResponseSickState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdminResponseSickStateCopyWith<$Res> {
  factory $AdminResponseSickStateCopyWith(AdminResponseSickState value,
          $Res Function(AdminResponseSickState) then) =
      _$AdminResponseSickStateCopyWithImpl<$Res, AdminResponseSickState>;
  @useResult
  $Res call({int counter});
}

/// @nodoc
class _$AdminResponseSickStateCopyWithImpl<$Res,
        $Val extends AdminResponseSickState>
    implements $AdminResponseSickStateCopyWith<$Res> {
  _$AdminResponseSickStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AdminResponseSickState
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
abstract class _$$AdminResponseSickStateImplCopyWith<$Res>
    implements $AdminResponseSickStateCopyWith<$Res> {
  factory _$$AdminResponseSickStateImplCopyWith(
          _$AdminResponseSickStateImpl value,
          $Res Function(_$AdminResponseSickStateImpl) then) =
      __$$AdminResponseSickStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int counter});
}

/// @nodoc
class __$$AdminResponseSickStateImplCopyWithImpl<$Res>
    extends _$AdminResponseSickStateCopyWithImpl<$Res,
        _$AdminResponseSickStateImpl>
    implements _$$AdminResponseSickStateImplCopyWith<$Res> {
  __$$AdminResponseSickStateImplCopyWithImpl(
      _$AdminResponseSickStateImpl _value,
      $Res Function(_$AdminResponseSickStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AdminResponseSickState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? counter = null,
  }) {
    return _then(_$AdminResponseSickStateImpl(
      counter: null == counter
          ? _value.counter
          : counter // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$AdminResponseSickStateImpl implements _AdminResponseSickState {
  _$AdminResponseSickStateImpl({this.counter = 0});

  @override
  @JsonKey()
  int counter;

  @override
  String toString() {
    return 'AdminResponseSickState(counter: $counter)';
  }

  /// Create a copy of AdminResponseSickState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AdminResponseSickStateImplCopyWith<_$AdminResponseSickStateImpl>
      get copyWith => __$$AdminResponseSickStateImplCopyWithImpl<
          _$AdminResponseSickStateImpl>(this, _$identity);
}

abstract class _AdminResponseSickState implements AdminResponseSickState {
  factory _AdminResponseSickState({int counter}) = _$AdminResponseSickStateImpl;

  @override
  int get counter;
  set counter(int value);

  /// Create a copy of AdminResponseSickState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AdminResponseSickStateImplCopyWith<_$AdminResponseSickStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
