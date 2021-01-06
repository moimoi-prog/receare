// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'main_screen_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$MainScreenStateTearOff {
  const _$MainScreenStateTearOff();

// ignore: unused_element
  MainScreenStateData call({int myEventTabIndex = 0}) {
    return MainScreenStateData(
      myEventTabIndex: myEventTabIndex,
    );
  }

// ignore: unused_element
  MainScreenStateLoading loading() {
    return const MainScreenStateLoading();
  }
}

/// @nodoc
// ignore: unused_element
const $MainScreenState = _$MainScreenStateTearOff();

/// @nodoc
mixin _$MainScreenState {
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(int myEventTabIndex), {
    @required Result loading(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(int myEventTabIndex), {
    Result loading(),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(MainScreenStateData value), {
    @required Result loading(MainScreenStateLoading value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(MainScreenStateData value), {
    Result loading(MainScreenStateLoading value),
    @required Result orElse(),
  });
}

/// @nodoc
abstract class $MainScreenStateCopyWith<$Res> {
  factory $MainScreenStateCopyWith(
          MainScreenState value, $Res Function(MainScreenState) then) =
      _$MainScreenStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$MainScreenStateCopyWithImpl<$Res>
    implements $MainScreenStateCopyWith<$Res> {
  _$MainScreenStateCopyWithImpl(this._value, this._then);

  final MainScreenState _value;
  // ignore: unused_field
  final $Res Function(MainScreenState) _then;
}

/// @nodoc
abstract class $MainScreenStateDataCopyWith<$Res> {
  factory $MainScreenStateDataCopyWith(
          MainScreenStateData value, $Res Function(MainScreenStateData) then) =
      _$MainScreenStateDataCopyWithImpl<$Res>;
  $Res call({int myEventTabIndex});
}

/// @nodoc
class _$MainScreenStateDataCopyWithImpl<$Res>
    extends _$MainScreenStateCopyWithImpl<$Res>
    implements $MainScreenStateDataCopyWith<$Res> {
  _$MainScreenStateDataCopyWithImpl(
      MainScreenStateData _value, $Res Function(MainScreenStateData) _then)
      : super(_value, (v) => _then(v as MainScreenStateData));

  @override
  MainScreenStateData get _value => super._value as MainScreenStateData;

  @override
  $Res call({
    Object myEventTabIndex = freezed,
  }) {
    return _then(MainScreenStateData(
      myEventTabIndex: myEventTabIndex == freezed
          ? _value.myEventTabIndex
          : myEventTabIndex as int,
    ));
  }
}

/// @nodoc
class _$MainScreenStateData implements MainScreenStateData {
  const _$MainScreenStateData({this.myEventTabIndex = 0})
      : assert(myEventTabIndex != null);

  @JsonKey(defaultValue: 0)
  @override
  final int myEventTabIndex;

  @override
  String toString() {
    return 'MainScreenState(myEventTabIndex: $myEventTabIndex)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is MainScreenStateData &&
            (identical(other.myEventTabIndex, myEventTabIndex) ||
                const DeepCollectionEquality()
                    .equals(other.myEventTabIndex, myEventTabIndex)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(myEventTabIndex);

  @override
  $MainScreenStateDataCopyWith<MainScreenStateData> get copyWith =>
      _$MainScreenStateDataCopyWithImpl<MainScreenStateData>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(int myEventTabIndex), {
    @required Result loading(),
  }) {
    assert($default != null);
    assert(loading != null);
    return $default(myEventTabIndex);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(int myEventTabIndex), {
    Result loading(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if ($default != null) {
      return $default(myEventTabIndex);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(MainScreenStateData value), {
    @required Result loading(MainScreenStateLoading value),
  }) {
    assert($default != null);
    assert(loading != null);
    return $default(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(MainScreenStateData value), {
    Result loading(MainScreenStateLoading value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class MainScreenStateData implements MainScreenState {
  const factory MainScreenStateData({int myEventTabIndex}) =
      _$MainScreenStateData;

  int get myEventTabIndex;
  $MainScreenStateDataCopyWith<MainScreenStateData> get copyWith;
}

/// @nodoc
abstract class $MainScreenStateLoadingCopyWith<$Res> {
  factory $MainScreenStateLoadingCopyWith(MainScreenStateLoading value,
          $Res Function(MainScreenStateLoading) then) =
      _$MainScreenStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$MainScreenStateLoadingCopyWithImpl<$Res>
    extends _$MainScreenStateCopyWithImpl<$Res>
    implements $MainScreenStateLoadingCopyWith<$Res> {
  _$MainScreenStateLoadingCopyWithImpl(MainScreenStateLoading _value,
      $Res Function(MainScreenStateLoading) _then)
      : super(_value, (v) => _then(v as MainScreenStateLoading));

  @override
  MainScreenStateLoading get _value => super._value as MainScreenStateLoading;
}

/// @nodoc
class _$MainScreenStateLoading implements MainScreenStateLoading {
  const _$MainScreenStateLoading();

  @override
  String toString() {
    return 'MainScreenState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is MainScreenStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(int myEventTabIndex), {
    @required Result loading(),
  }) {
    assert($default != null);
    assert(loading != null);
    return loading();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(int myEventTabIndex), {
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
    Result $default(MainScreenStateData value), {
    @required Result loading(MainScreenStateLoading value),
  }) {
    assert($default != null);
    assert(loading != null);
    return loading(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(MainScreenStateData value), {
    Result loading(MainScreenStateLoading value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class MainScreenStateLoading implements MainScreenState {
  const factory MainScreenStateLoading() = _$MainScreenStateLoading;
}
