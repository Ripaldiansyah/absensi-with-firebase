// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'admin_leaves_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AdminLeavesDetailState {
  Map<String, dynamic>? get response => throw _privateConstructorUsedError;
  set response(Map<String, dynamic>? value) =>
      throw _privateConstructorUsedError;

  /// Create a copy of AdminLeavesDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AdminLeavesDetailStateCopyWith<AdminLeavesDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdminLeavesDetailStateCopyWith<$Res> {
  factory $AdminLeavesDetailStateCopyWith(AdminLeavesDetailState value,
          $Res Function(AdminLeavesDetailState) then) =
      _$AdminLeavesDetailStateCopyWithImpl<$Res, AdminLeavesDetailState>;
  @useResult
  $Res call({Map<String, dynamic>? response});
}

/// @nodoc
class _$AdminLeavesDetailStateCopyWithImpl<$Res,
        $Val extends AdminLeavesDetailState>
    implements $AdminLeavesDetailStateCopyWith<$Res> {
  _$AdminLeavesDetailStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AdminLeavesDetailState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? response = freezed,
  }) {
    return _then(_value.copyWith(
      response: freezed == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AdminLeavesDetailStateImplCopyWith<$Res>
    implements $AdminLeavesDetailStateCopyWith<$Res> {
  factory _$$AdminLeavesDetailStateImplCopyWith(
          _$AdminLeavesDetailStateImpl value,
          $Res Function(_$AdminLeavesDetailStateImpl) then) =
      __$$AdminLeavesDetailStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Map<String, dynamic>? response});
}

/// @nodoc
class __$$AdminLeavesDetailStateImplCopyWithImpl<$Res>
    extends _$AdminLeavesDetailStateCopyWithImpl<$Res,
        _$AdminLeavesDetailStateImpl>
    implements _$$AdminLeavesDetailStateImplCopyWith<$Res> {
  __$$AdminLeavesDetailStateImplCopyWithImpl(
      _$AdminLeavesDetailStateImpl _value,
      $Res Function(_$AdminLeavesDetailStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AdminLeavesDetailState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? response = freezed,
  }) {
    return _then(_$AdminLeavesDetailStateImpl(
      response: freezed == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc

class _$AdminLeavesDetailStateImpl implements _AdminLeavesDetailState {
  _$AdminLeavesDetailStateImpl({this.response = null});

  @override
  @JsonKey()
  Map<String, dynamic>? response;

  @override
  String toString() {
    return 'AdminLeavesDetailState(response: $response)';
  }

  /// Create a copy of AdminLeavesDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AdminLeavesDetailStateImplCopyWith<_$AdminLeavesDetailStateImpl>
      get copyWith => __$$AdminLeavesDetailStateImplCopyWithImpl<
          _$AdminLeavesDetailStateImpl>(this, _$identity);
}

abstract class _AdminLeavesDetailState implements AdminLeavesDetailState {
  factory _AdminLeavesDetailState({Map<String, dynamic>? response}) =
      _$AdminLeavesDetailStateImpl;

  @override
  Map<String, dynamic>? get response;
  set response(Map<String, dynamic>? value);

  /// Create a copy of AdminLeavesDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AdminLeavesDetailStateImplCopyWith<_$AdminLeavesDetailStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
