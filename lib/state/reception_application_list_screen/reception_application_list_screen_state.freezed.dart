// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'reception_application_list_screen_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$ReceptionApplicationListScreenStateTearOff {
  const _$ReceptionApplicationListScreenStateTearOff();

// ignore: unused_element
  ReceptionApplicationListScreenStateData call(
      {List<Map<String, dynamic>> receptionMapList = const []}) {
    return ReceptionApplicationListScreenStateData(
      receptionMapList: receptionMapList,
    );
  }

// ignore: unused_element
  ReceptionApplicationListScreenStateLoading loading() {
    return const ReceptionApplicationListScreenStateLoading();
  }
}

/// @nodoc
// ignore: unused_element
const $ReceptionApplicationListScreenState =
    _$ReceptionApplicationListScreenStateTearOff();

/// @nodoc
mixin _$ReceptionApplicationListScreenState {
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(List<Map<String, dynamic>> receptionMapList), {
    @required Result loading(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(List<Map<String, dynamic>> receptionMapList), {
    Result loading(),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(ReceptionApplicationListScreenStateData value), {
    @required Result loading(ReceptionApplicationListScreenStateLoading value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(ReceptionApplicationListScreenStateData value), {
    Result loading(ReceptionApplicationListScreenStateLoading value),
    @required Result orElse(),
  });
}

/// @nodoc
abstract class $ReceptionApplicationListScreenStateCopyWith<$Res> {
  factory $ReceptionApplicationListScreenStateCopyWith(
          ReceptionApplicationListScreenState value,
          $Res Function(ReceptionApplicationListScreenState) then) =
      _$ReceptionApplicationListScreenStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$ReceptionApplicationListScreenStateCopyWithImpl<$Res>
    implements $ReceptionApplicationListScreenStateCopyWith<$Res> {
  _$ReceptionApplicationListScreenStateCopyWithImpl(this._value, this._then);

  final ReceptionApplicationListScreenState _value;
  // ignore: unused_field
  final $Res Function(ReceptionApplicationListScreenState) _then;
}

/// @nodoc
abstract class $ReceptionApplicationListScreenStateDataCopyWith<$Res> {
  factory $ReceptionApplicationListScreenStateDataCopyWith(
          ReceptionApplicationListScreenStateData value,
          $Res Function(ReceptionApplicationListScreenStateData) then) =
      _$ReceptionApplicationListScreenStateDataCopyWithImpl<$Res>;
  $Res call({List<Map<String, dynamic>> receptionMapList});
}

/// @nodoc
class _$ReceptionApplicationListScreenStateDataCopyWithImpl<$Res>
    extends _$ReceptionApplicationListScreenStateCopyWithImpl<$Res>
    implements $ReceptionApplicationListScreenStateDataCopyWith<$Res> {
  _$ReceptionApplicationListScreenStateDataCopyWithImpl(
      ReceptionApplicationListScreenStateData _value,
      $Res Function(ReceptionApplicationListScreenStateData) _then)
      : super(
            _value, (v) => _then(v as ReceptionApplicationListScreenStateData));

  @override
  ReceptionApplicationListScreenStateData get _value =>
      super._value as ReceptionApplicationListScreenStateData;

  @override
  $Res call({
    Object receptionMapList = freezed,
  }) {
    return _then(ReceptionApplicationListScreenStateData(
      receptionMapList: receptionMapList == freezed
          ? _value.receptionMapList
          : receptionMapList as List<Map<String, dynamic>>,
    ));
  }
}

/// @nodoc
class _$ReceptionApplicationListScreenStateData
    implements ReceptionApplicationListScreenStateData {
  const _$ReceptionApplicationListScreenStateData(
      {this.receptionMapList = const []})
      : assert(receptionMapList != null);

  @JsonKey(defaultValue: const [])
  @override
  final List<Map<String, dynamic>> receptionMapList;

  @override
  String toString() {
    return 'ReceptionApplicationListScreenState(receptionMapList: $receptionMapList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ReceptionApplicationListScreenStateData &&
            (identical(other.receptionMapList, receptionMapList) ||
                const DeepCollectionEquality()
                    .equals(other.receptionMapList, receptionMapList)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(receptionMapList);

  @override
  $ReceptionApplicationListScreenStateDataCopyWith<
          ReceptionApplicationListScreenStateData>
      get copyWith => _$ReceptionApplicationListScreenStateDataCopyWithImpl<
          ReceptionApplicationListScreenStateData>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(List<Map<String, dynamic>> receptionMapList), {
    @required Result loading(),
  }) {
    assert($default != null);
    assert(loading != null);
    return $default(receptionMapList);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(List<Map<String, dynamic>> receptionMapList), {
    Result loading(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if ($default != null) {
      return $default(receptionMapList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(ReceptionApplicationListScreenStateData value), {
    @required Result loading(ReceptionApplicationListScreenStateLoading value),
  }) {
    assert($default != null);
    assert(loading != null);
    return $default(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(ReceptionApplicationListScreenStateData value), {
    Result loading(ReceptionApplicationListScreenStateLoading value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class ReceptionApplicationListScreenStateData
    implements ReceptionApplicationListScreenState {
  const factory ReceptionApplicationListScreenStateData(
          {List<Map<String, dynamic>> receptionMapList}) =
      _$ReceptionApplicationListScreenStateData;

  List<Map<String, dynamic>> get receptionMapList;
  $ReceptionApplicationListScreenStateDataCopyWith<
      ReceptionApplicationListScreenStateData> get copyWith;
}

/// @nodoc
abstract class $ReceptionApplicationListScreenStateLoadingCopyWith<$Res> {
  factory $ReceptionApplicationListScreenStateLoadingCopyWith(
          ReceptionApplicationListScreenStateLoading value,
          $Res Function(ReceptionApplicationListScreenStateLoading) then) =
      _$ReceptionApplicationListScreenStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$ReceptionApplicationListScreenStateLoadingCopyWithImpl<$Res>
    extends _$ReceptionApplicationListScreenStateCopyWithImpl<$Res>
    implements $ReceptionApplicationListScreenStateLoadingCopyWith<$Res> {
  _$ReceptionApplicationListScreenStateLoadingCopyWithImpl(
      ReceptionApplicationListScreenStateLoading _value,
      $Res Function(ReceptionApplicationListScreenStateLoading) _then)
      : super(_value,
            (v) => _then(v as ReceptionApplicationListScreenStateLoading));

  @override
  ReceptionApplicationListScreenStateLoading get _value =>
      super._value as ReceptionApplicationListScreenStateLoading;
}

/// @nodoc
class _$ReceptionApplicationListScreenStateLoading
    implements ReceptionApplicationListScreenStateLoading {
  const _$ReceptionApplicationListScreenStateLoading();

  @override
  String toString() {
    return 'ReceptionApplicationListScreenState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ReceptionApplicationListScreenStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(List<Map<String, dynamic>> receptionMapList), {
    @required Result loading(),
  }) {
    assert($default != null);
    assert(loading != null);
    return loading();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(List<Map<String, dynamic>> receptionMapList), {
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
    Result $default(ReceptionApplicationListScreenStateData value), {
    @required Result loading(ReceptionApplicationListScreenStateLoading value),
  }) {
    assert($default != null);
    assert(loading != null);
    return loading(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(ReceptionApplicationListScreenStateData value), {
    Result loading(ReceptionApplicationListScreenStateLoading value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class ReceptionApplicationListScreenStateLoading
    implements ReceptionApplicationListScreenState {
  const factory ReceptionApplicationListScreenStateLoading() =
      _$ReceptionApplicationListScreenStateLoading;
}
