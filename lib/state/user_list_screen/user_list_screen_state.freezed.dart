// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'user_list_screen_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$UserListScreenStateTearOff {
  const _$UserListScreenStateTearOff();

// ignore: unused_element
  UserListScreenStateData call(
      {List<Map<String, dynamic>> userMapList = const []}) {
    return UserListScreenStateData(
      userMapList: userMapList,
    );
  }

// ignore: unused_element
  UserListScreenStateLoading loading() {
    return const UserListScreenStateLoading();
  }
}

/// @nodoc
// ignore: unused_element
const $UserListScreenState = _$UserListScreenStateTearOff();

/// @nodoc
mixin _$UserListScreenState {
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(List<Map<String, dynamic>> userMapList), {
    @required Result loading(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(List<Map<String, dynamic>> userMapList), {
    Result loading(),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(UserListScreenStateData value), {
    @required Result loading(UserListScreenStateLoading value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(UserListScreenStateData value), {
    Result loading(UserListScreenStateLoading value),
    @required Result orElse(),
  });
}

/// @nodoc
abstract class $UserListScreenStateCopyWith<$Res> {
  factory $UserListScreenStateCopyWith(
          UserListScreenState value, $Res Function(UserListScreenState) then) =
      _$UserListScreenStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$UserListScreenStateCopyWithImpl<$Res>
    implements $UserListScreenStateCopyWith<$Res> {
  _$UserListScreenStateCopyWithImpl(this._value, this._then);

  final UserListScreenState _value;
  // ignore: unused_field
  final $Res Function(UserListScreenState) _then;
}

/// @nodoc
abstract class $UserListScreenStateDataCopyWith<$Res> {
  factory $UserListScreenStateDataCopyWith(UserListScreenStateData value,
          $Res Function(UserListScreenStateData) then) =
      _$UserListScreenStateDataCopyWithImpl<$Res>;
  $Res call({List<Map<String, dynamic>> userMapList});
}

/// @nodoc
class _$UserListScreenStateDataCopyWithImpl<$Res>
    extends _$UserListScreenStateCopyWithImpl<$Res>
    implements $UserListScreenStateDataCopyWith<$Res> {
  _$UserListScreenStateDataCopyWithImpl(UserListScreenStateData _value,
      $Res Function(UserListScreenStateData) _then)
      : super(_value, (v) => _then(v as UserListScreenStateData));

  @override
  UserListScreenStateData get _value => super._value as UserListScreenStateData;

  @override
  $Res call({
    Object userMapList = freezed,
  }) {
    return _then(UserListScreenStateData(
      userMapList: userMapList == freezed
          ? _value.userMapList
          : userMapList as List<Map<String, dynamic>>,
    ));
  }
}

/// @nodoc
class _$UserListScreenStateData implements UserListScreenStateData {
  const _$UserListScreenStateData({this.userMapList = const []})
      : assert(userMapList != null);

  @JsonKey(defaultValue: const [])
  @override
  final List<Map<String, dynamic>> userMapList;

  @override
  String toString() {
    return 'UserListScreenState(userMapList: $userMapList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UserListScreenStateData &&
            (identical(other.userMapList, userMapList) ||
                const DeepCollectionEquality()
                    .equals(other.userMapList, userMapList)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(userMapList);

  @override
  $UserListScreenStateDataCopyWith<UserListScreenStateData> get copyWith =>
      _$UserListScreenStateDataCopyWithImpl<UserListScreenStateData>(
          this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(List<Map<String, dynamic>> userMapList), {
    @required Result loading(),
  }) {
    assert($default != null);
    assert(loading != null);
    return $default(userMapList);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(List<Map<String, dynamic>> userMapList), {
    Result loading(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if ($default != null) {
      return $default(userMapList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(UserListScreenStateData value), {
    @required Result loading(UserListScreenStateLoading value),
  }) {
    assert($default != null);
    assert(loading != null);
    return $default(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(UserListScreenStateData value), {
    Result loading(UserListScreenStateLoading value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class UserListScreenStateData implements UserListScreenState {
  const factory UserListScreenStateData(
      {List<Map<String, dynamic>> userMapList}) = _$UserListScreenStateData;

  List<Map<String, dynamic>> get userMapList;
  $UserListScreenStateDataCopyWith<UserListScreenStateData> get copyWith;
}

/// @nodoc
abstract class $UserListScreenStateLoadingCopyWith<$Res> {
  factory $UserListScreenStateLoadingCopyWith(UserListScreenStateLoading value,
          $Res Function(UserListScreenStateLoading) then) =
      _$UserListScreenStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$UserListScreenStateLoadingCopyWithImpl<$Res>
    extends _$UserListScreenStateCopyWithImpl<$Res>
    implements $UserListScreenStateLoadingCopyWith<$Res> {
  _$UserListScreenStateLoadingCopyWithImpl(UserListScreenStateLoading _value,
      $Res Function(UserListScreenStateLoading) _then)
      : super(_value, (v) => _then(v as UserListScreenStateLoading));

  @override
  UserListScreenStateLoading get _value =>
      super._value as UserListScreenStateLoading;
}

/// @nodoc
class _$UserListScreenStateLoading implements UserListScreenStateLoading {
  const _$UserListScreenStateLoading();

  @override
  String toString() {
    return 'UserListScreenState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is UserListScreenStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(List<Map<String, dynamic>> userMapList), {
    @required Result loading(),
  }) {
    assert($default != null);
    assert(loading != null);
    return loading();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(List<Map<String, dynamic>> userMapList), {
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
    Result $default(UserListScreenStateData value), {
    @required Result loading(UserListScreenStateLoading value),
  }) {
    assert($default != null);
    assert(loading != null);
    return loading(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(UserListScreenStateData value), {
    Result loading(UserListScreenStateLoading value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class UserListScreenStateLoading implements UserListScreenState {
  const factory UserListScreenStateLoading() = _$UserListScreenStateLoading;
}
