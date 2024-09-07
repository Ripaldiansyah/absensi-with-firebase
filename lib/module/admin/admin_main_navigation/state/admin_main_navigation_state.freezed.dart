// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'admin_main_navigation_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AdminMainNavigationState {
  int get counter => throw _privateConstructorUsedError;
  set counter(int value) => throw _privateConstructorUsedError;

  /// Create a copy of AdminMainNavigationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AdminMainNavigationStateCopyWith<AdminMainNavigationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdminMainNavigationStateCopyWith<$Res> {
  factory $AdminMainNavigationStateCopyWith(AdminMainNavigationState value,
          $Res Function(AdminMainNavigationState) then) =
      _$AdminMainNavigationStateCopyWithImpl<$Res, AdminMainNavigationState>;
  @useResult
  $Res call({int counter});
}

/// @nodoc
class _$AdminMainNavigationStateCopyWithImpl<$Res,
        $Val extends AdminMainNavigationState>
    implements $AdminMainNavigationStateCopyWith<$Res> {
  _$AdminMainNavigationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AdminMainNavigationState
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
abstract class _$$AdminMainNavigationStateImplCopyWith<$Res>
    implements $AdminMainNavigationStateCopyWith<$Res> {
  factory _$$AdminMainNavigationStateImplCopyWith(
          _$AdminMainNavigationStateImpl value,
          $Res Function(_$AdminMainNavigationStateImpl) then) =
      __$$AdminMainNavigationStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int counter});
}

/// @nodoc
class __$$AdminMainNavigationStateImplCopyWithImpl<$Res>
    extends _$AdminMainNavigationStateCopyWithImpl<$Res,
        _$AdminMainNavigationStateImpl>
    implements _$$AdminMainNavigationStateImplCopyWith<$Res> {
  __$$AdminMainNavigationStateImplCopyWithImpl(
      _$AdminMainNavigationStateImpl _value,
      $Res Function(_$AdminMainNavigationStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AdminMainNavigationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? counter = null,
  }) {
    return _then(_$AdminMainNavigationStateImpl(
      counter: null == counter
          ? _value.counter
          : counter // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$AdminMainNavigationStateImpl implements _AdminMainNavigationState {
  _$AdminMainNavigationStateImpl({this.counter = 0});

  @override
  @JsonKey()
  int counter;

  @override
  String toString() {
    return 'AdminMainNavigationState(counter: $counter)';
  }

  /// Create a copy of AdminMainNavigationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AdminMainNavigationStateImplCopyWith<_$AdminMainNavigationStateImpl>
      get copyWith => __$$AdminMainNavigationStateImplCopyWithImpl<
          _$AdminMainNavigationStateImpl>(this, _$identity);
}

abstract class _AdminMainNavigationState implements AdminMainNavigationState {
  factory _AdminMainNavigationState({int counter}) =
      _$AdminMainNavigationStateImpl;

  @override
  int get counter;
  set counter(int value);

  /// Create a copy of AdminMainNavigationState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AdminMainNavigationStateImplCopyWith<_$AdminMainNavigationStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
