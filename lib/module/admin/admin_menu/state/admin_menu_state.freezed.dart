// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'admin_menu_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AdminMenuState {
  int get counter => throw _privateConstructorUsedError;
  set counter(int value) => throw _privateConstructorUsedError;

  /// Create a copy of AdminMenuState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AdminMenuStateCopyWith<AdminMenuState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdminMenuStateCopyWith<$Res> {
  factory $AdminMenuStateCopyWith(
          AdminMenuState value, $Res Function(AdminMenuState) then) =
      _$AdminMenuStateCopyWithImpl<$Res, AdminMenuState>;
  @useResult
  $Res call({int counter});
}

/// @nodoc
class _$AdminMenuStateCopyWithImpl<$Res, $Val extends AdminMenuState>
    implements $AdminMenuStateCopyWith<$Res> {
  _$AdminMenuStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AdminMenuState
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
abstract class _$$AdminMenuStateImplCopyWith<$Res>
    implements $AdminMenuStateCopyWith<$Res> {
  factory _$$AdminMenuStateImplCopyWith(_$AdminMenuStateImpl value,
          $Res Function(_$AdminMenuStateImpl) then) =
      __$$AdminMenuStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int counter});
}

/// @nodoc
class __$$AdminMenuStateImplCopyWithImpl<$Res>
    extends _$AdminMenuStateCopyWithImpl<$Res, _$AdminMenuStateImpl>
    implements _$$AdminMenuStateImplCopyWith<$Res> {
  __$$AdminMenuStateImplCopyWithImpl(
      _$AdminMenuStateImpl _value, $Res Function(_$AdminMenuStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AdminMenuState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? counter = null,
  }) {
    return _then(_$AdminMenuStateImpl(
      counter: null == counter
          ? _value.counter
          : counter // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$AdminMenuStateImpl implements _AdminMenuState {
  _$AdminMenuStateImpl({this.counter = 0});

  @override
  @JsonKey()
  int counter;

  @override
  String toString() {
    return 'AdminMenuState(counter: $counter)';
  }

  /// Create a copy of AdminMenuState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AdminMenuStateImplCopyWith<_$AdminMenuStateImpl> get copyWith =>
      __$$AdminMenuStateImplCopyWithImpl<_$AdminMenuStateImpl>(
          this, _$identity);
}

abstract class _AdminMenuState implements AdminMenuState {
  factory _AdminMenuState({int counter}) = _$AdminMenuStateImpl;

  @override
  int get counter;
  set counter(int value);

  /// Create a copy of AdminMenuState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AdminMenuStateImplCopyWith<_$AdminMenuStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
