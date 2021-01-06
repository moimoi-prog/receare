// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'friend_list_screen_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$FriendListScreenStateTearOff {
  const _$FriendListScreenStateTearOff();

// ignore: unused_element
  FriendListScreenStateData call(
      {List<Map<String, dynamic>> friendMapList = const []}) {
    return FriendListScreenStateData(
      friendMapList: friendMapList,
    );
  }

// ignore: unused_element
  FriendListScreenStateLoading loading() {
    return const FriendListScreenStateLoading();
  }
}

/// @nodoc
// ignore: unused_element
const $FriendListScreenState = _$FriendListScreenStateTearOff();

/// @nodoc
mixin _$FriendListScreenState {
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(List<Map<String, dynamic>> friendMapList), {
    @required Result loading(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(List<Map<String, dynamic>> friendMapList), {
    Result loading(),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(FriendListScreenStateData value), {
    @required Result loading(FriendListScreenStateLoading value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(FriendListScreenStateData value), {
    Result loading(FriendListScreenStateLoading value),
    @required Result orElse(),
  });
}

/// @nodoc
abstract class $FriendListScreenStateCopyWith<$Res> {
  factory $FriendListScreenStateCopyWith(FriendListScreenState value,
          $Res Function(FriendListScreenState) then) =
      _$FriendListScreenStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$FriendListScreenStateCopyWithImpl<$Res>
    implements $FriendListScreenStateCopyWith<$Res> {
  _$FriendListScreenStateCopyWithImpl(this._value, this._then);

  final FriendListScreenState _value;
  // ignore: unused_field
  final $Res Function(FriendListScreenState) _then;
}

/// @nodoc
abstract class $FriendListScreenStateDataCopyWith<$Res> {
  factory $FriendListScreenStateDataCopyWith(FriendListScreenStateData value,
          $Res Function(FriendListScreenStateData) then) =
      _$FriendListScreenStateDataCopyWithImpl<$Res>;
  $Res call({List<Map<String, dynamic>> friendMapList});
}

/// @nodoc
class _$FriendListScreenStateDataCopyWithImpl<$Res>
    extends _$FriendListScreenStateCopyWithImpl<$Res>
    implements $FriendListScreenStateDataCopyWith<$Res> {
  _$FriendListScreenStateDataCopyWithImpl(FriendListScreenStateData _value,
      $Res Function(FriendListScreenStateData) _then)
      : super(_value, (v) => _then(v as FriendListScreenStateData));

  @override
  FriendListScreenStateData get _value =>
      super._value as FriendListScreenStateData;

  @override
  $Res call({
    Object friendMapList = freezed,
  }) {
    return _then(FriendListScreenStateData(
      friendMapList: friendMapList == freezed
          ? _value.friendMapList
          : friendMapList as List<Map<String, dynamic>>,
    ));
  }
}

/// @nodoc
class _$FriendListScreenStateData implements FriendListScreenStateData {
  const _$FriendListScreenStateData({this.friendMapList = const []})
      : assert(friendMapList != null);

  @JsonKey(defaultValue: const [])
  @override
  final List<Map<String, dynamic>> friendMapList;

  @override
  String toString() {
    return 'FriendListScreenState(friendMapList: $friendMapList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is FriendListScreenStateData &&
            (identical(other.friendMapList, friendMapList) ||
                const DeepCollectionEquality()
                    .equals(other.friendMapList, friendMapList)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(friendMapList);

  @override
  $FriendListScreenStateDataCopyWith<FriendListScreenStateData> get copyWith =>
      _$FriendListScreenStateDataCopyWithImpl<FriendListScreenStateData>(
          this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(List<Map<String, dynamic>> friendMapList), {
    @required Result loading(),
  }) {
    assert($default != null);
    assert(loading != null);
    return $default(friendMapList);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(List<Map<String, dynamic>> friendMapList), {
    Result loading(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if ($default != null) {
      return $default(friendMapList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(FriendListScreenStateData value), {
    @required Result loading(FriendListScreenStateLoading value),
  }) {
    assert($default != null);
    assert(loading != null);
    return $default(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(FriendListScreenStateData value), {
    Result loading(FriendListScreenStateLoading value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class FriendListScreenStateData implements FriendListScreenState {
  const factory FriendListScreenStateData(
      {List<Map<String, dynamic>> friendMapList}) = _$FriendListScreenStateData;

  List<Map<String, dynamic>> get friendMapList;
  $FriendListScreenStateDataCopyWith<FriendListScreenStateData> get copyWith;
}

/// @nodoc
abstract class $FriendListScreenStateLoadingCopyWith<$Res> {
  factory $FriendListScreenStateLoadingCopyWith(
          FriendListScreenStateLoading value,
          $Res Function(FriendListScreenStateLoading) then) =
      _$FriendListScreenStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$FriendListScreenStateLoadingCopyWithImpl<$Res>
    extends _$FriendListScreenStateCopyWithImpl<$Res>
    implements $FriendListScreenStateLoadingCopyWith<$Res> {
  _$FriendListScreenStateLoadingCopyWithImpl(
      FriendListScreenStateLoading _value,
      $Res Function(FriendListScreenStateLoading) _then)
      : super(_value, (v) => _then(v as FriendListScreenStateLoading));

  @override
  FriendListScreenStateLoading get _value =>
      super._value as FriendListScreenStateLoading;
}

/// @nodoc
class _$FriendListScreenStateLoading implements FriendListScreenStateLoading {
  const _$FriendListScreenStateLoading();

  @override
  String toString() {
    return 'FriendListScreenState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is FriendListScreenStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(List<Map<String, dynamic>> friendMapList), {
    @required Result loading(),
  }) {
    assert($default != null);
    assert(loading != null);
    return loading();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(List<Map<String, dynamic>> friendMapList), {
    Result loading(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(FriendListScreenStateData value), {
    @required Result loading(FriendListScreenStateLoading value),
  }) {
    assert($default != null);
    assert(loading != null);
    return loading(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(FriendListScreenStateData value), {
    Result loading(FriendListScreenStateLoading value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class FriendListScreenStateLoading implements FriendListScreenState {
  const factory FriendListScreenStateLoading() = _$FriendListScreenStateLoading;
}
