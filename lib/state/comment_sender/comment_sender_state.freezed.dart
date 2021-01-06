// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'comment_sender_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$CommentSenderStateTearOff {
  const _$CommentSenderStateTearOff();

// ignore: unused_element
  CommentSenderStateData call(
      {bool enabled = false, TextEditingController commentController}) {
    return CommentSenderStateData(
      enabled: enabled,
      commentController: commentController,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $CommentSenderState = _$CommentSenderStateTearOff();

/// @nodoc
mixin _$CommentSenderState {
  bool get enabled;
  TextEditingController get commentController;

  $CommentSenderStateCopyWith<CommentSenderState> get copyWith;
}

/// @nodoc
abstract class $CommentSenderStateCopyWith<$Res> {
  factory $CommentSenderStateCopyWith(
          CommentSenderState value, $Res Function(CommentSenderState) then) =
      _$CommentSenderStateCopyWithImpl<$Res>;
  $Res call({bool enabled, TextEditingController commentController});
}

/// @nodoc
class _$CommentSenderStateCopyWithImpl<$Res>
    implements $CommentSenderStateCopyWith<$Res> {
  _$CommentSenderStateCopyWithImpl(this._value, this._then);

  final CommentSenderState _value;
  // ignore: unused_field
  final $Res Function(CommentSenderState) _then;

  @override
  $Res call({
    Object enabled = freezed,
    Object commentController = freezed,
  }) {
    return _then(_value.copyWith(
      enabled: enabled == freezed ? _value.enabled : enabled as bool,
      commentController: commentController == freezed
          ? _value.commentController
          : commentController as TextEditingController,
    ));
  }
}

/// @nodoc
abstract class $CommentSenderStateDataCopyWith<$Res>
    implements $CommentSenderStateCopyWith<$Res> {
  factory $CommentSenderStateDataCopyWith(CommentSenderStateData value,
          $Res Function(CommentSenderStateData) then) =
      _$CommentSenderStateDataCopyWithImpl<$Res>;
  @override
  $Res call({bool enabled, TextEditingController commentController});
}

/// @nodoc
class _$CommentSenderStateDataCopyWithImpl<$Res>
    extends _$CommentSenderStateCopyWithImpl<$Res>
    implements $CommentSenderStateDataCopyWith<$Res> {
  _$CommentSenderStateDataCopyWithImpl(CommentSenderStateData _value,
      $Res Function(CommentSenderStateData) _then)
      : super(_value, (v) => _then(v as CommentSenderStateData));

  @override
  CommentSenderStateData get _value => super._value as CommentSenderStateData;

  @override
  $Res call({
    Object enabled = freezed,
    Object commentController = freezed,
  }) {
    return _then(CommentSenderStateData(
      enabled: enabled == freezed ? _value.enabled : enabled as bool,
      commentController: commentController == freezed
          ? _value.commentController
          : commentController as TextEditingController,
    ));
  }
}

/// @nodoc
class _$CommentSenderStateData implements CommentSenderStateData {
  const _$CommentSenderStateData({this.enabled = false, this.commentController})
      : assert(enabled != null);

  @JsonKey(defaultValue: false)
  @override
  final bool enabled;
  @override
  final TextEditingController commentController;

  @override
  String toString() {
    return 'CommentSenderState(enabled: $enabled, commentController: $commentController)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CommentSenderStateData &&
            (identical(other.enabled, enabled) ||
                const DeepCollectionEquality()
                    .equals(other.enabled, enabled)) &&
            (identical(other.commentController, commentController) ||
                const DeepCollectionEquality()
                    .equals(other.commentController, commentController)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(enabled) ^
      const DeepCollectionEquality().hash(commentController);

  @override
  $CommentSenderStateDataCopyWith<CommentSenderStateData> get copyWith =>
      _$CommentSenderStateDataCopyWithImpl<CommentSenderStateData>(
          this, _$identity);
}

abstract class CommentSenderStateData implements CommentSenderState {
  const factory CommentSenderStateData(
      {bool enabled,
      TextEditingController commentController}) = _$CommentSenderStateData;

  @override
  bool get enabled;
  @override
  TextEditingController get commentController;
  @override
  $CommentSenderStateDataCopyWith<CommentSenderStateData> get copyWith;
}
