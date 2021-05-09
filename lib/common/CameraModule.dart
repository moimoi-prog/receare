import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:image_picker/image_picker.dart';

import 'CommonModule.dart';

// --------------------------------
// メソッド名 : localPath
// 処理概要　 : 画像の保存先パスを返す
// --------------------------------
Future get localPath async {
  final directory = await getApplicationDocumentsDirectory();
  return directory.path;
}

// --------------------------------
// メソッド名 : saveLocalImage
// 処理概要　 : ドキュメントへ画像を保存する
// --------------------------------
Future saveLocalImage(File image) async {
  String formatted = getFormattedDate('yyyyMMddHHmmss');

  final documentPath = await localPath;
  final imagePath = "$documentPath/$formatted-image.jpg";

  File imageFile = File(imagePath);

  // 一時フォルダに保存された画像をドキュメントへ保存し直す
  var saveFile = await imageFile.writeAsBytes(await image.readAsBytes());

  return saveFile;
}

// --------------------------------
// メソッド名 : leadLocalImage
// 処理概要　 : ドキュメントの画像を取得する
// --------------------------------
Future leadLocalImage() async {
  String formatted = getFormattedDate('yyyyMMddHHmmss');

  final path = await localPath;
  final imagePath = "$path/$formatted-image.jpg";
  return File(imagePath);
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

  // 戻り値を返す
  return saveFile;
}
