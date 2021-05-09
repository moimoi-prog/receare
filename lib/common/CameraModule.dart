import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:image_picker/image_picker.dart';

import 'CommonModule.dart';

// --------------------------------
// メソッド名 : localPath
// 処理概要　 : 画像を保存する場所のパスを返す
// --------------------------------
Future get localPath async {
  final directory = await getApplicationDocumentsDirectory();
  return directory.path;
}

// --------------------------------
// メソッド名 : saveLocalImage
// 処理概要　 : 画像を保存する
// --------------------------------
Future saveLocalImage(File image) async {
  // ファイル名の元となる文字列を生成
  String formatted = getFormattedDate('yyyyMMddHHmmss');

  // ファイルパスを生成
  final documentPath = await localPath;
  final imagePath = "$documentPath/$formatted-image.jpg";

  // ファイルオブジェクトを生成
  File imageFile = File(imagePath);

  // 引数のファイルを保存する
  var saveFile = await imageFile.writeAsBytes(await image.readAsBytes());

  // 保存したファイルオブジェクトを返す
  return saveFile;
}

// --------------------------------
// メソッド名 : getAndSaveImageFromDevice
// 処理概要　 : カメラかライブラリから画像を取得する
// --------------------------------
Future<File> getAndSaveImageFromDevice(ImageSource source) async {
  // 画像を取得
  final picker = ImagePicker();
  var pickImage = await picker.getImage(source: source);

  // 画像を取得できたか判定
  // 出来なかった場合はnullを返す
  if (pickImage == null) {
    return null;
  }

  // 画像をFileオブジェクトに格納する
  File image = File(pickImage.path);

  // 画像を保存する
  var saveFile = await saveLocalImage(image);

  // 取得したファイルオブジェクトを返す
  return saveFile;
}
