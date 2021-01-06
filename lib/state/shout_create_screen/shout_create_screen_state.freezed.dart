// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'shout_create_screen_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$ShoutCreateScreenStateTearOff {
  const _$ShoutCreateScreenStateTearOff();

// ignore: unused_element
  ShoutCreateScreenStateData call(
      {String detail,
      List<Asset> imageList = const [],
      File video,
      TextEditingController tagListController}) {
    return ShoutCreateScreenStateData(
      detail: detail,
      imageList: imageList,
      video: video,
      tagListController: tagListController,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $ShoutCreateScreenState = _$ShoutCreateScreenStateTearOff();

/// @nodoc
mixin _$ShoutCreateScreenState {
  String get detail; // 内容
  List<Asset> get imageList; // 画像一覧
  File get video; // 動画
  TextEditingController get tagListController;

  $ShoutCreateScreenStateCopyWith<ShoutCreateScreenState> get copyWith;
}

/// @nodoc
abstract class $ShoutCreateScreenStateCopyWith<$Res> {
  factory $ShoutCreateScreenStateCopyWith(ShoutCreateScreenState value,
          $Res Function(ShoutCreateScreenState) then) =
      _$ShoutCreateScreenStateCopyWithImpl<$Res>;
  $Res call(
      {String detail,
      List<Asset> imageList,
      File video,
      TextEditingController tagListController});
}

/// @nodoc
class _$ShoutCreateScreenStateCopyWithImpl<$Res>
    implements $ShoutCreateScreenStateCopyWith<$Res> {
  _$ShoutCreateScreenStateCopyWithImpl(this._value, this._then);

  final ShoutCreateScreenState _value;
  // ignore: unused_field
  final $Res Function(ShoutCreateScreenState) _then;

  @override
  $Res call({
    Object detail = freezed,
    Object imageList = freezed,
    Object video = freezed,
    Object tagListController = freezed,
  }) {
    return _then(_value.copyWith(
      detail: detail == freezed ? _value.detail : detail as String,
      imageList:
          imageList == freezed ? _value.imageList : imageList as List<Asset>,
      video: video == freezed ? _value.video : video as File,
      tagListController: tagListController == freezed
          ? _value.tagListController
          : tagListController as TextEditingController,
    ));
  }
}

/// @nodoc
abstract class $ShoutCreateScreenStateDataCopyWith<$Res>
    implements $ShoutCreateScreenStateCopyWith<$Res> {
  factory $ShoutCreateScreenStateDataCopyWith(ShoutCreateScreenStateData value,
          $Res Function(ShoutCreateScreenStateData) then) =
      _$ShoutCreateScreenStateDataCopyWithImpl<$Res>;
  @override
  $Res call(
      {String detail,
      List<Asset> imageList,
      File video,
      TextEditingController tagListController});
}

/// @nodoc
class _$ShoutCreateScreenStateDataCopyWithImpl<$Res>
    extends _$ShoutCreateScreenStateCopyWithImpl<$Res>
    implements $ShoutCreateScreenStateDataCopyWith<$Res> {
  _$ShoutCreateScreenStateDataCopyWithImpl(ShoutCreateScreenStateData _value,
      $Res Function(ShoutCreateScreenStateData) _then)
      : super(_value, (v) => _then(v as ShoutCreateScreenStateData));

  @override
  ShoutCreateScreenStateData get _value =>
      super._value as ShoutCreateScreenStateData;

  @override
  $Res call({
    Object detail = freezed,
    Object imageList = freezed,
    Object video = freezed,
    Object tagListController = freezed,
  }) {
    return _then(ShoutCreateScreenStateData(
      detail: detail == freezed ? _value.detail : detail as String,
      imageList:
          imageList == freezed ? _value.imageList : imageList as List<Asset>,
      video: video == freezed ? _value.video : video as File,
      tagListController: tagListController == freezed
          ? _value.tagListController
          : tagListController as TextEditingController,
    ));
  }
}

/// @nodoc
class _$ShoutCreateScreenStateData implements ShoutCreateScreenStateData {
  const _$ShoutCreateScreenStateData(
      {this.detail,
      this.imageList = const [],
      this.video,
      this.tagListController})
      : assert(imageList != null);

  @override
  final String detail;
  @JsonKey(defaultValue: const [])
  @override // 内容
  final List<Asset> imageList;
  @override // 画像一覧
  final File video;
  @override // 動画
  final TextEditingController tagListController;

  @override
  String toString() {
    return 'ShoutCreateScreenState(detail: $detail, imageList: $imageList, video: $video, tagListController: $tagListController)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ShoutCreateScreenStateData &&
            (identical(other.detail, detail) ||
                const DeepCollectionEquality().equals(other.detail, detail)) &&
            (identical(other.imageList, imageList) ||
                const DeepCollectionEquality()
                    .equals(other.imageList, imageList)) &&
            (identical(other.video, video) ||
                const DeepCollectionEquality().equals(other.video, video)) &&
            (identical(other.tagListController, tagListController) ||
                const DeepCollectionEquality()
                    .equals(other.tagListController, tagListController)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(detail) ^
      const DeepCollectionEquality().hash(imageList) ^
      const DeepCollectionEquality().hash(video) ^
      const DeepCollectionEquality().hash(tagListController);

  @override
  $ShoutCreateScreenStateDataCopyWith<ShoutCreateScreenStateData>
      get copyWith =>
          _$ShoutCreateScreenStateDataCopyWithImpl<ShoutCreateScreenStateData>(
              this, _$identity);
}

abstract class ShoutCreateScreenStateData implements ShoutCreateScreenState {
  const factory ShoutCreateScreenStateData(
      {String detail,
      List<Asset> imageList,
      File video,
      TextEditingController tagListController}) = _$ShoutCreateScreenStateData;

  @override
  String get detail;
  @override // 内容
  List<Asset> get imageList;
  @override // 画像一覧
  File get video;
  @override // 動画
  TextEditingController get tagListController;
  @override
  $ShoutCreateScreenStateDataCopyWith<ShoutCreateScreenStateData> get copyWith;
}
