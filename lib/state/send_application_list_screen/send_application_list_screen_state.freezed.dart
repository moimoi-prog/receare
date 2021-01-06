// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'send_application_list_screen_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$SendApplicationListScreenStateTearOff {
  const _$SendApplicationListScreenStateTearOff();

// ignore: unused_element
  SendApplicationListScreenStateData call(
      {List<Map<String, dynamic>> sendMapList = const []}) {
    return SendApplicationListScreenStateData(
      sendMapList: sendMapList,
    );
  }

// ignore: unused_element
  SendApplicationListScreenStateLoading loading() {
    return const SendApplicationListScreenStateLoading();
  }
}

/// @nodoc
// ignore: unused_element
const $SendApplicationListScreenState =
    _$SendApplicationListScreenStateTearOff();

/// @nodoc
mixin _$SendApplicationListScreenState {
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(List<Map<String, dynamic>> sendMapList), {
    @required Result loading(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(List<Map<String, dynamic>> sendMapList), {
    Result loading(),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(SendApplicationListScreenStateData value), {
    @required Result loading(SendApplicationListScreenStateLoading value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(SendApplicationListScreenStateData value), {
    Result loading(SendApplicationListScreenStateLoading value),
    @required Result orElse(),
  });
}

/// @nodoc
abstract class $SendApplicationListScreenStateCopyWith<$Res> {
  factory $SendApplicationListScreenStateCopyWith(
          SendApplicationListScreenState value,
          $Res Function(SendApplicationListScreenState) then) =
      _$SendApplicationListScreenStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$SendApplicationListScreenStateCopyWithImpl<$Res>
    implements $SendApplicationListScreenStateCopyWith<$Res> {
  _$SendApplicationListScreenStateCopyWithImpl(this._value, this._then);

  final SendApplicationListScreenState _value;
  // ignore: unused_field
  final $Res Function(SendApplicationListScreenState) _then;
}

/// @nodoc
abstract class $SendApplicationListScreenStateDataCopyWith<$Res> {
  factory $SendApplicationListScreenStateDataCopyWith(
          SendApplicationListScreenStateData value,
          $Res Function(SendApplicationListScreenStateData) then) =
      _$SendApplicationListScreenStateDataCopyWithImpl<$Res>;
  $Res call({List<Map<String, dynamic>> sendMapList});
}

/// @nodoc
class _$SendApplicationListScreenStateDataCopyWithImpl<$Res>
    extends _$SendApplicationListScreenStateCopyWithImpl<$Res>
    implements $SendApplicationListScreenStateDataCopyWith<$Res> {
  _$SendApplicationListScreenStateDataCopyWithImpl(
      SendApplicationListScreenStateData _value,
      $Res Function(SendApplicationListScreenStateData) _then)
      : super(_value, (v) => _then(v as SendApplicationListScreenStateData));

  @override
  SendApplicationListScreenStateData get _value =>
      super._value as SendApplicationListScreenStateData;

  @override
  $Res call({
    Object sendMapList = freezed,
  }) {
    return _then(SendApplicationListScreenStateData(
      sendMapList: sendMapList == freezed
          ? _value.sendMapList
          : sendMapList as List<Map<String, dynamic>>,
    ));
  }
}

/// @nodoc
class _$SendApplicationListScreenStateData
    implements SendApplicationListScreenStateData {
  const _$SendApplicationListScreenStateData({this.sendMapList = const []})
      : assert(sendMapList != null);

  @JsonKey(defaultValue: const [])
  @override
  final List<Map<String, dynamic>> sendMapList;

  @override
  String toString() {
    return 'SendApplicationListScreenState(sendMapList: $sendMapList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SendApplicationListScreenStateData &&
            (identical(other.sendMapList, sendMapList) ||
                const DeepCollectionEquality()
                    .equals(other.sendMapList, sendMapList)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(sendMapList);

  @override
  $SendApplicationListScreenStateDataCopyWith<
          SendApplicationListScreenStateData>
      get copyWith => _$SendApplicationListScreenStateDataCopyWithImpl<
          SendApplicationListScreenStateData>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(List<Map<String, dynamic>> sendMapList), {
    @required Result loading(),
  }) {
    assert($default != null);
    assert(loading != null);
    return $default(sendMapList);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(List<Map<String, dynamic>> sendMapList), {
    Result loading(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if ($default != null) {
      return $default(sendMapList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(SendApplicationListScreenStateData value), {
    @required Result loading(SendApplicationListScreenStateLoading value),
  }) {
    assert($default != null);
    assert(loading != null);
    return $default(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(SendApplicationListScreenStateData value), {
    Result loading(SendApplicationListScreenStateLoading value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class SendApplicationListScreenStateData
    implements SendApplicationListScreenState {
  const factory SendApplicationListScreenStateData(
          {List<Map<String, dynamic>> sendMapList}) =
      _$SendApplicationListScreenStateData;

  List<Map<String, dynamic>> get sendMapList;
  $SendApplicationListScreenStateDataCopyWith<
      SendApplicationListScreenStateData> get copyWith;
}

/// @nodoc
abstract class $SendApplicationListScreenStateLoadingCopyWith<$Res> {
  factory $SendApplicationListScreenStateLoadingCopyWith(
          SendApplicationListScreenStateLoading value,
          $Res Function(SendApplicationListScreenStateLoading) then) =
      _$SendApplicationListScreenStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$SendApplicationListScreenStateLoadingCopyWithImpl<$Res>
    extends _$SendApplicationListScreenStateCopyWithImpl<$Res>
    implements $SendApplicationListScreenStateLoadingCopyWith<$Res> {
  _$SendApplicationListScreenStateLoadingCopyWithImpl(
      SendApplicationListScreenStateLoading _value,
      $Res Function(SendApplicationListScreenStateLoading) _then)
      : super(_value, (v) => _then(v as SendApplicationListScreenStateLoading));

  @override
  SendApplicationListScreenStateLoading get _value =>
      super._value as SendApplicationListScreenStateLoading;
}

/// @nodoc
class _$SendApplicationListScreenStateLoading
    implements SendApplicationListScreenStateLoading {
  const _$SendApplicationListScreenStateLoading();

  @override
  String toString() {
    return 'SendApplicationListScreenState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SendApplicationListScreenStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(List<Map<String, dynamic>> sendMapList), {
    @required Result loading(),
  }) {
    assert($default != null);
    assert(loading != null);
    return loading();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(List<Map<String, dynamic>> sendMapList), {
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
    Result $default(SendApplicationListScreenStateData value), {
    @required Result loading(SendApplicationListScreenStateLoading value),
  }) {
    assert($default != null);
    assert(loading != null);
    return loading(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(SendApplicationListScreenStateData value), {
    Result loading(SendApplicationListScreenStateLoading value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class SendApplicationListScreenStateLoading
    implements SendApplicationListScreenState {
  const factory SendApplicationListScreenStateLoading() =
      _$SendApplicationListScreenStateLoading;
}
