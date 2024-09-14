// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'admin_leaves_list_by_user_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AdminLeavesListByUserState {
  List<dynamic>? get leaves => throw _privateConstructorUsedError;
  set leaves(List<dynamic>? value) => throw _privateConstructorUsedError;

  /// Create a copy of AdminLeavesListByUserState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AdminLeavesListByUserStateCopyWith<AdminLeavesListByUserState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdminLeavesListByUserStateCopyWith<$Res> {
  factory $AdminLeavesListByUserStateCopyWith(AdminLeavesListByUserState value,
          $Res Function(AdminLeavesListByUserState) then) =
      _$AdminLeavesListByUserStateCopyWithImpl<$Res,
          AdminLeavesListByUserState>;
  @useResult
  $Res call({List<dynamic>? leaves});
}

/// @nodoc
class _$AdminLeavesListByUserStateCopyWithImpl<$Res,
        $Val extends AdminLeavesListByUserState>
    implements $AdminLeavesListByUserStateCopyWith<$Res> {
  _$AdminLeavesListByUserStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AdminLeavesListByUserState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? leaves = freezed,
  }) {
    return _then(_value.copyWith(
      leaves: freezed == leaves
          ? _value.leaves
          : leaves // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AdminLeavesListByUserStateImplCopyWith<$Res>
    implements $AdminLeavesListByUserStateCopyWith<$Res> {
  factory _$$AdminLeavesListByUserStateImplCopyWith(
          _$AdminLeavesListByUserStateImpl value,
          $Res Function(_$AdminLeavesListByUserStateImpl) then) =
      __$$AdminLeavesListByUserStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<dynamic>? leaves});
}

/// @nodoc
class __$$AdminLeavesListByUserStateImplCopyWithImpl<$Res>
    extends _$AdminLeavesListByUserStateCopyWithImpl<$Res,
        _$AdminLeavesListByUserStateImpl>
    implements _$$AdminLeavesListByUserStateImplCopyWith<$Res> {
  __$$AdminLeavesListByUserStateImplCopyWithImpl(
      _$AdminLeavesListByUserStateImpl _value,
      $Res Function(_$AdminLeavesListByUserStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AdminLeavesListByUserState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? leaves = freezed,
  }) {
    return _then(_$AdminLeavesListByUserStateImpl(
      leaves: freezed == leaves
          ? _value.leaves
          : leaves // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
    ));
  }
}

/// @nodoc

class _$AdminLeavesListByUserStateImpl implements _AdminLeavesListByUserState {
  _$AdminLeavesListByUserStateImpl({this.leaves = null});

  @override
  @JsonKey()
  List<dynamic>? leaves;

  @override
  String toString() {
    return 'AdminLeavesListByUserState(leaves: $leaves)';
  }

  /// Create a copy of AdminLeavesListByUserState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AdminLeavesListByUserStateImplCopyWith<_$AdminLeavesListByUserStateImpl>
      get copyWith => __$$AdminLeavesListByUserStateImplCopyWithImpl<
          _$AdminLeavesListByUserStateImpl>(this, _$identity);
}

abstract class _AdminLeavesListByUserState
    implements AdminLeavesListByUserState {
  factory _AdminLeavesListByUserState({List<dynamic>? leaves}) =
      _$AdminLeavesListByUserStateImpl;

  @override
  List<dynamic>? get leaves;
  set leaves(List<dynamic>? value);

  /// Create a copy of AdminLeavesListByUserState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AdminLeavesListByUserStateImplCopyWith<_$AdminLeavesListByUserStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
