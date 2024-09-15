// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'admin_sick_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AdminSickDetailState {
  int get counter => throw _privateConstructorUsedError;
  set counter(int value) => throw _privateConstructorUsedError;

  /// Create a copy of AdminSickDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AdminSickDetailStateCopyWith<AdminSickDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdminSickDetailStateCopyWith<$Res> {
  factory $AdminSickDetailStateCopyWith(AdminSickDetailState value,
          $Res Function(AdminSickDetailState) then) =
      _$AdminSickDetailStateCopyWithImpl<$Res, AdminSickDetailState>;
  @useResult
  $Res call({int counter});
}

/// @nodoc
class _$AdminSickDetailStateCopyWithImpl<$Res,
        $Val extends AdminSickDetailState>
    implements $AdminSickDetailStateCopyWith<$Res> {
  _$AdminSickDetailStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AdminSickDetailState
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
abstract class _$$AdminSickDetailStateImplCopyWith<$Res>
    implements $AdminSickDetailStateCopyWith<$Res> {
  factory _$$AdminSickDetailStateImplCopyWith(_$AdminSickDetailStateImpl value,
          $Res Function(_$AdminSickDetailStateImpl) then) =
      __$$AdminSickDetailStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int counter});
}

/// @nodoc
class __$$AdminSickDetailStateImplCopyWithImpl<$Res>
    extends _$AdminSickDetailStateCopyWithImpl<$Res, _$AdminSickDetailStateImpl>
    implements _$$AdminSickDetailStateImplCopyWith<$Res> {
  __$$AdminSickDetailStateImplCopyWithImpl(_$AdminSickDetailStateImpl _value,
      $Res Function(_$AdminSickDetailStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AdminSickDetailState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? counter = null,
  }) {
    return _then(_$AdminSickDetailStateImpl(
      counter: null == counter
          ? _value.counter
          : counter // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$AdminSickDetailStateImpl implements _AdminSickDetailState {
  _$AdminSickDetailStateImpl({this.counter = 0});

  @override
  @JsonKey()
  int counter;

  @override
  String toString() {
    return 'AdminSickDetailState(counter: $counter)';
  }

  /// Create a copy of AdminSickDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AdminSickDetailStateImplCopyWith<_$AdminSickDetailStateImpl>
      get copyWith =>
          __$$AdminSickDetailStateImplCopyWithImpl<_$AdminSickDetailStateImpl>(
              this, _$identity);
}

abstract class _AdminSickDetailState implements AdminSickDetailState {
  factory _AdminSickDetailState({int counter}) = _$AdminSickDetailStateImpl;

  @override
  int get counter;
  set counter(int value);

  /// Create a copy of AdminSickDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AdminSickDetailStateImplCopyWith<_$AdminSickDetailStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
