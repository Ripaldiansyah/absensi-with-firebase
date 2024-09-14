// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'admin_response_sick_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AdminResponseSickDetailState {
  int get counter => throw _privateConstructorUsedError;
  set counter(int value) => throw _privateConstructorUsedError;

  /// Create a copy of AdminResponseSickDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AdminResponseSickDetailStateCopyWith<AdminResponseSickDetailState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdminResponseSickDetailStateCopyWith<$Res> {
  factory $AdminResponseSickDetailStateCopyWith(
          AdminResponseSickDetailState value,
          $Res Function(AdminResponseSickDetailState) then) =
      _$AdminResponseSickDetailStateCopyWithImpl<$Res,
          AdminResponseSickDetailState>;
  @useResult
  $Res call({int counter});
}

/// @nodoc
class _$AdminResponseSickDetailStateCopyWithImpl<$Res,
        $Val extends AdminResponseSickDetailState>
    implements $AdminResponseSickDetailStateCopyWith<$Res> {
  _$AdminResponseSickDetailStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AdminResponseSickDetailState
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
abstract class _$$AdminResponseSickDetailStateImplCopyWith<$Res>
    implements $AdminResponseSickDetailStateCopyWith<$Res> {
  factory _$$AdminResponseSickDetailStateImplCopyWith(
          _$AdminResponseSickDetailStateImpl value,
          $Res Function(_$AdminResponseSickDetailStateImpl) then) =
      __$$AdminResponseSickDetailStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int counter});
}

/// @nodoc
class __$$AdminResponseSickDetailStateImplCopyWithImpl<$Res>
    extends _$AdminResponseSickDetailStateCopyWithImpl<$Res,
        _$AdminResponseSickDetailStateImpl>
    implements _$$AdminResponseSickDetailStateImplCopyWith<$Res> {
  __$$AdminResponseSickDetailStateImplCopyWithImpl(
      _$AdminResponseSickDetailStateImpl _value,
      $Res Function(_$AdminResponseSickDetailStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AdminResponseSickDetailState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? counter = null,
  }) {
    return _then(_$AdminResponseSickDetailStateImpl(
      counter: null == counter
          ? _value.counter
          : counter // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$AdminResponseSickDetailStateImpl
    implements _AdminResponseSickDetailState {
  _$AdminResponseSickDetailStateImpl({this.counter = 0});

  @override
  @JsonKey()
  int counter;

  @override
  String toString() {
    return 'AdminResponseSickDetailState(counter: $counter)';
  }

  /// Create a copy of AdminResponseSickDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AdminResponseSickDetailStateImplCopyWith<
          _$AdminResponseSickDetailStateImpl>
      get copyWith => __$$AdminResponseSickDetailStateImplCopyWithImpl<
          _$AdminResponseSickDetailStateImpl>(this, _$identity);
}

abstract class _AdminResponseSickDetailState
    implements AdminResponseSickDetailState {
  factory _AdminResponseSickDetailState({int counter}) =
      _$AdminResponseSickDetailStateImpl;

  @override
  int get counter;
  set counter(int value);

  /// Create a copy of AdminResponseSickDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AdminResponseSickDetailStateImplCopyWith<
          _$AdminResponseSickDetailStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
