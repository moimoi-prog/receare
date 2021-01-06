// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'shout_list_screen_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$ShoutListScreenStateTearOff {
  const _$ShoutListScreenStateTearOff();

// ignore: unused_element
  ShoutListScreenStateData call(
      {List<Map<String, dynamic>> shoutMapList = const []}) {
    return ShoutListScreenStateData(
      shoutMapList: shoutMapList,
    );
  }

// ignore: unused_element
  ShoutListScreenStateLoading loading() {
    return const ShoutListScreenStateLoading();
  }
}

/// @nodoc
// ignore: unused_element
const $ShoutListScreenState = _$ShoutListScreenStateTearOff();

/// @nodoc
mixin _$ShoutListScreenState {
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(List<Map<String, dynamic>> shoutMapList), {
    @required Result loading(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(List<Map<String, dynamic>> shoutMapList), {
    Result loading(),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(ShoutListScreenStateData value), {
    @required Result loading(ShoutListScreenStateLoading value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(ShoutListScreenStateData value), {
    Result loading(ShoutListScreenStateLoading value),
    @required Result orElse(),
  });
}

/// @nodoc
abstract class $ShoutListScreenStateCopyWith<$Res> {
  factory $ShoutListScreenStateCopyWith(ShoutListScreenState value,
          $Res Function(ShoutListScreenState) then) =
      _$ShoutListScreenStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$ShoutListScreenStateCopyWithImpl<$Res>
    implements $ShoutListScreenStateCopyWith<$Res> {
  _$ShoutListScreenStateCopyWithImpl(this._value, this._then);

  final ShoutListScreenState _value;
  // ignore: unused_field
  final $Res Function(ShoutListScreenState) _then;
}

/// @nodoc
abstract class $ShoutListScreenStateDataCopyWith<$Res> {
  factory $ShoutListScreenStateDataCopyWith(ShoutListScreenStateData value,
          $Res Function(ShoutListScreenStateData) then) =
      _$ShoutListScreenStateDataCopyWithImpl<$Res>;
  $Res call({List<Map<String, dynamic>> shoutMapList});
}

/// @nodoc
class _$ShoutListScreenStateDataCopyWithImpl<$Res>
    extends _$ShoutListScreenStateCopyWithImpl<$Res>
    implements $ShoutListScreenStateDataCopyWith<$Res> {
  _$ShoutListScreenStateDataCopyWithImpl(ShoutListScreenStateData _value,
      $Res Function(ShoutListScreenStateData) _then)
      : super(_value, (v) => _then(v as ShoutListScreenStateData));

  @override
  ShoutListScreenStateData get _value =>
      super._value as ShoutListScreenStateData;

  @override
  $Res call({
    Object shoutMapList = freezed,
  }) {
    return _then(ShoutListScreenStateData(
      shoutMapList: shoutMapList == freezed
          ? _value.shoutMapList
          : shoutMapList as List<Map<String, dynamic>>,
    ));
  }
}

/// @nodoc
class _$ShoutListScreenStateData implements ShoutListScreenStateData {
  const _$ShoutListScreenStateData({this.shoutMapList = const []})
      : assert(shoutMapList != null);

  @JsonKey(defaultValue: const [])
  @override
  final List<Map<String, dynamic>> shoutMapList;

  @override
  String toString() {
    return 'ShoutListScreenState(shoutMapList: $shoutMapList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ShoutListScreenStateData &&
            (identical(other.shoutMapList, shoutMapList) ||
                const DeepCollectionEquality()
                    .equals(other.shoutMapList, shoutMapList)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(shoutMapList);

  @override
  $ShoutListScreenStateDataCopyWith<ShoutListScreenStateData> get copyWith =>
      _$ShoutListScreenStateDataCopyWithImpl<ShoutListScreenStateData>(
          this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(List<Map<String, dynamic>> shoutMapList), {
    @required Result loading(),
  }) {
    assert($default != null);
    assert(loading != null);
    return $default(shoutMapList);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(List<Map<String, dynamic>> shoutMapList), {
    Result loading(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if ($default != null) {
      return $default(shoutMapList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(ShoutListScreenStateData value), {
    @required Result loading(ShoutListScreenStateLoading value),
  }) {
    assert($default != null);
    assert(loading != null);
    return $default(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(ShoutListScreenStateData value), {
    Result loading(ShoutListScreenStateLoading value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class ShoutListScreenStateData implements ShoutListScreenState {
  const factory ShoutListScreenStateData(
      {List<Map<String, dynamic>> shoutMapList}) = _$ShoutListScreenStateData;

  List<Map<String, dynamic>> get shoutMapList;
  $ShoutListScreenStateDataCopyWith<ShoutListScreenStateData> get copyWith;
}

/// @nodoc
abstract class $ShoutListScreenStateLoadingCopyWith<$Res> {
  factory $ShoutListScreenStateLoadingCopyWith(
          ShoutListScreenStateLoading value,
          $Res Function(ShoutListScreenStateLoading) then) =
      _$ShoutListScreenStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$ShoutListScreenStateLoadingCopyWithImpl<$Res>
    extends _$ShoutListScreenStateCopyWithImpl<$Res>
    implements $ShoutListScreenStateLoadingCopyWith<$Res> {
  _$ShoutListScreenStateLoadingCopyWithImpl(ShoutListScreenStateLoading _value,
      $Res Function(ShoutListScreenStateLoading) _then)
      : super(_value, (v) => _then(v as ShoutListScreenStateLoading));

  @override
  ShoutListScreenStateLoading get _value =>
      super._value as ShoutListScreenStateLoading;
}

/// @nodoc
class _$ShoutListScreenStateLoading implements ShoutListScreenStateLoading {
  const _$ShoutListScreenStateLoading();

  @override
  String toString() {
    return 'ShoutListScreenState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is ShoutListScreenStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(List<Map<String, dynamic>> shoutMapList), {
    @required Result loading(),
  }) {
    assert($default != null);
    assert(loading != null);
    return loading();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(List<Map<String, dynamic>> shoutMapList), {
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
    Result $default(ShoutListScreenStateData value), {
    @required Result loading(ShoutListScreenStateLoading value),
  }) {
    assert($default != null);
    assert(loading != null);
    return loading(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(ShoutListScreenStateData value), {
    Result loading(ShoutListScreenStateLoading value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class ShoutListScreenStateLoading implements ShoutListScreenState {
  const factory ShoutListScreenStateLoading() = _$ShoutListScreenStateLoading;
}
