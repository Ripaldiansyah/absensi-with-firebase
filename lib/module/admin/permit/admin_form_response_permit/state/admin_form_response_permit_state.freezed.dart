// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'admin_form_response_permit_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AdminFormResponsePermitState {
  int get counter => throw _privateConstructorUsedError;
  set counter(int value) => throw _privateConstructorUsedError;

  /// Create a copy of AdminFormResponsePermitState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AdminFormResponsePermitStateCopyWith<AdminFormResponsePermitState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdminFormResponsePermitStateCopyWith<$Res> {
  factory $AdminFormResponsePermitStateCopyWith(
          AdminFormResponsePermitState value,
          $Res Function(AdminFormResponsePermitState) then) =
      _$AdminFormResponsePermitStateCopyWithImpl<$Res,
          AdminFormResponsePermitState>;
  @useResult
  $Res call({int counter});
}

/// @nodoc
class _$AdminFormResponsePermitStateCopyWithImpl<$Res,
        $Val extends AdminFormResponsePermitState>
    implements $AdminFormResponsePermitStateCopyWith<$Res> {
  _$AdminFormResponsePermitStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AdminFormResponsePermitState
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
abstract class _$$AdminFormResponsePermitStateImplCopyWith<$Res>
    implements $AdminFormResponsePermitStateCopyWith<$Res> {
  factory _$$AdminFormResponsePermitStateImplCopyWith(
          _$AdminFormResponsePermitStateImpl value,
          $Res Function(_$AdminFormResponsePermitStateImpl) then) =
      __$$AdminFormResponsePermitStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int counter});
}

/// @nodoc
class __$$AdminFormResponsePermitStateImplCopyWithImpl<$Res>
    extends _$AdminFormResponsePermitStateCopyWithImpl<$Res,
        _$AdminFormResponsePermitStateImpl>
    implements _$$AdminFormResponsePermitStateImplCopyWith<$Res> {
  __$$AdminFormResponsePermitStateImplCopyWithImpl(
      _$AdminFormResponsePermitStateImpl _value,
      $Res Function(_$AdminFormResponsePermitStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AdminFormResponsePermitState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? counter = null,
  }) {
    return _then(_$AdminFormResponsePermitStateImpl(
      counter: null == counter
          ? _value.counter
          : counter // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$AdminFormResponsePermitStateImpl
    implements _AdminFormResponsePermitState {
  _$AdminFormResponsePermitStateImpl({this.counter = 0});

  @override
  @JsonKey()
  int counter;

  @override
  String toString() {
    return 'AdminFormResponsePermitState(counter: $counter)';
  }

  /// Create a copy of AdminFormResponsePermitState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AdminFormResponsePermitStateImplCopyWith<
          _$AdminFormResponsePermitStateImpl>
      get copyWith => __$$AdminFormResponsePermitStateImplCopyWithImpl<
          _$AdminFormResponsePermitStateImpl>(this, _$identity);
}

abstract class _AdminFormResponsePermitState
    implements AdminFormResponsePermitState {
  factory _AdminFormResponsePermitState({int counter}) =
      _$AdminFormResponsePermitStateImpl;

  @override
  int get counter;
  set counter(int value);

  /// Create a copy of AdminFormResponsePermitState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AdminFormResponsePermitStateImplCopyWith<
          _$AdminFormResponsePermitStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
