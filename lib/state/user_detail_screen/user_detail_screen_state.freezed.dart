// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'user_detail_screen_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$UserDetailScreenStateTearOff {
  const _$UserDetailScreenStateTearOff();

// ignore: unused_element
  UserDetailScreenStateData call(
      {DocumentSnapshot userDoc,
      List<Map<String, dynamic>> shoutMapList = const []}) {
    return UserDetailScreenStateData(
      userDoc: userDoc,
      shoutMapList: shoutMapList,
    );
  }

// ignore: unused_element
  UserDetailScreenStateLoading loading() {
    return const UserDetailScreenStateLoading();
  }
}

/// @nodoc
// ignore: unused_element
const $UserDetailScreenState = _$UserDetailScreenStateTearOff();

/// @nodoc
mixin _$UserDetailScreenState {
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(
        DocumentSnapshot userDoc, List<Map<String, dynamic>> shoutMapList), {
    @required Result loading(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(
        DocumentSnapshot userDoc, List<Map<String, dynamic>> shoutMapList), {
    Result loading(),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(UserDetailScreenStateData value), {
    @required Result loading(UserDetailScreenStateLoading value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(UserDetailScreenStateData value), {
    Result loading(UserDetailScreenStateLoading value),
    @required Result orElse(),
  });
}

/// @nodoc
abstract class $UserDetailScreenStateCopyWith<$Res> {
  factory $UserDetailScreenStateCopyWith(UserDetailScreenState value,
          $Res Function(UserDetailScreenState) then) =
      _$UserDetailScreenStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$UserDetailScreenStateCopyWithImpl<$Res>
    implements $UserDetailScreenStateCopyWith<$Res> {
  _$UserDetailScreenStateCopyWithImpl(this._value, this._then);

  final UserDetailScreenState _value;
  // ignore: unused_field
  final $Res Function(UserDetailScreenState) _then;
}

/// @nodoc
abstract class $UserDetailScreenStateDataCopyWith<$Res> {
  factory $UserDetailScreenStateDataCopyWith(UserDetailScreenStateData value,
          $Res Function(UserDetailScreenStateData) then) =
      _$UserDetailScreenStateDataCopyWithImpl<$Res>;
  $Res call(
      {DocumentSnapshot userDoc, List<Map<String, dynamic>> shoutMapList});
}

/// @nodoc
class _$UserDetailScreenStateDataCopyWithImpl<$Res>
    extends _$UserDetailScreenStateCopyWithImpl<$Res>
    implements $UserDetailScreenStateDataCopyWith<$Res> {
  _$UserDetailScreenStateDataCopyWithImpl(UserDetailScreenStateData _value,
      $Res Function(UserDetailScreenStateData) _then)
      : super(_value, (v) => _then(v as UserDetailScreenStateData));

  @override
  UserDetailScreenStateData get _value =>
      super._value as UserDetailScreenStateData;

  @override
  $Res call({
    Object userDoc = freezed,
    Object shoutMapList = freezed,
  }) {
    return _then(UserDetailScreenStateData(
      userDoc:
          userDoc == freezed ? _value.userDoc : userDoc as DocumentSnapshot,
      shoutMapList: shoutMapList == freezed
          ? _value.shoutMapList
          : shoutMapList as List<Map<String, dynamic>>,
    ));
  }
}

/// @nodoc
class _$UserDetailScreenStateData implements UserDetailScreenStateData {
  const _$UserDetailScreenStateData(
      {this.userDoc, this.shoutMapList = const []})
      : assert(shoutMapList != null);

  @override
  final DocumentSnapshot userDoc;
  @JsonKey(defaultValue: const [])
  @override // Userドキュメント
  final List<Map<String, dynamic>> shoutMapList;

  @override
  String toString() {
    return 'UserDetailScreenState(userDoc: $userDoc, shoutMapList: $shoutMapList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UserDetailScreenStateData &&
            (identical(other.userDoc, userDoc) ||
                const DeepCollectionEquality()
                    .equals(other.userDoc, userDoc)) &&
            (identical(other.shoutMapList, shoutMapList) ||
                const DeepCollectionEquality()
                    .equals(other.shoutMapList, shoutMapList)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(userDoc) ^
      const DeepCollectionEquality().hash(shoutMapList);

  @override
  $UserDetailScreenStateDataCopyWith<UserDetailScreenStateData> get copyWith =>
      _$UserDetailScreenStateDataCopyWithImpl<UserDetailScreenStateData>(
          this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(
        DocumentSnapshot userDoc, List<Map<String, dynamic>> shoutMapList), {
    @required Result loading(),
  }) {
    assert($default != null);
    assert(loading != null);
    return $default(userDoc, shoutMapList);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(
        DocumentSnapshot userDoc, List<Map<String, dynamic>> shoutMapList), {
    Result loading(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if ($default != null) {
      return $default(userDoc, shoutMapList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(UserDetailScreenStateData value), {
    @required Result loading(UserDetailScreenStateLoading value),
  }) {
    assert($default != null);
    assert(loading != null);
    return $default(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(UserDetailScreenStateData value), {
    Result loading(UserDetailScreenStateLoading value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class UserDetailScreenStateData implements UserDetailScreenState {
  const factory UserDetailScreenStateData(
      {DocumentSnapshot userDoc,
      List<Map<String, dynamic>> shoutMapList}) = _$UserDetailScreenStateData;

  DocumentSnapshot get userDoc; // Userドキュメント
  List<Map<String, dynamic>> get shoutMapList;
  $UserDetailScreenStateDataCopyWith<UserDetailScreenStateData> get copyWith;
}

/// @nodoc
abstract class $UserDetailScreenStateLoadingCopyWith<$Res> {
  factory $UserDetailScreenStateLoadingCopyWith(
          UserDetailScreenStateLoading value,
          $Res Function(UserDetailScreenStateLoading) then) =
      _$UserDetailScreenStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$UserDetailScreenStateLoadingCopyWithImpl<$Res>
    extends _$UserDetailScreenStateCopyWithImpl<$Res>
    implements $UserDetailScreenStateLoadingCopyWith<$Res> {
  _$UserDetailScreenStateLoadingCopyWithImpl(
      UserDetailScreenStateLoading _value,
      $Res Function(UserDetailScreenStateLoading) _then)
      : super(_value, (v) => _then(v as UserDetailScreenStateLoading));

  @override
  UserDetailScreenStateLoading get _value =>
      super._value as UserDetailScreenStateLoading;
}

/// @nodoc
class _$UserDetailScreenStateLoading implements UserDetailScreenStateLoading {
  const _$UserDetailScreenStateLoading();

  @override
  String toString() {
    return 'UserDetailScreenState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is UserDetailScreenStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(
        DocumentSnapshot userDoc, List<Map<String, dynamic>> shoutMapList), {
    @required Result loading(),
  }) {
    assert($default != null);
    assert(loading != null);
    return loading();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(
        DocumentSnapshot userDoc, List<Map<String, dynamic>> shoutMapList), {
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
    Result $default(UserDetailScreenStateData value), {
    @required Result loading(UserDetailScreenStateLoading value),
  }) {
    assert($default != null);
    assert(loading != null);
    return loading(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(UserDetailScreenStateData value), {
    Result loading(UserDetailScreenStateLoading value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class UserDetailScreenStateLoading implements UserDetailScreenState {
  const factory UserDetailScreenStateLoading() = _$UserDetailScreenStateLoading;
}
