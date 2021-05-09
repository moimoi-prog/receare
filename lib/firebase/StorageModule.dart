import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

// ------------------------------
// 変数を宣言
// ------------------------------
FirebaseStorage storage = FirebaseStorage();

// --------------------------------
// メソッド名 : uploadImage
// 処理概要　 : 画像をアップロード
// --------------------------------
Future<String> uploadImage(File file) async {
  // 保存先ディレクトリパスを生成
  String subDirectoryName = "images";

  // タイムスタンプを生成
  int timestamp = DateTime.now().millisecondsSinceEpoch;

  // ストレージへの参照を生成
  final StorageReference ref = storage
      .ref()
      .child(subDirectoryName)
      .child('${timestamp}');

  // ストレージへ画像を保存するタスクを生成
  final StorageUploadTask uploadTask = ref.putFile(
      file,
      StorageMetadata(
        contentType: "image/jpeg",
      ));

  // タスクを実行
  StorageTaskSnapshot snapshot = await uploadTask.onComplete;

  // 画像のURLを返す
  if (snapshot.error == null) {
    return await snapshot.ref.getDownloadURL();
  }

  // エラーをハンドリング
  switch (snapshot.error) {
    case StorageError.unknown:
    // something
    case StorageError.objectNotFound:
    // something
    case StorageError.bucketNotFound:
    // something
    case StorageError.projectNotFound:
    // something
    case StorageError.quotaExceeded:
    // something
    case StorageError.notAuthenticated:
    // something
    case StorageError.notAuthorized:
    // something
    case StorageError.retryLimitExceeded:
    // something
    case StorageError.invalidChecksum:
    // something
    case StorageError.canceled:
    // something
  }
  return null;

}

// --------------------------------
// メソッド名 : uploadShoutImage
// 処理概要　 : シャウト画像をアップロード
// --------------------------------
Future<String> uploadShoutImage(List<int> file) async {
  // 保存先ディレクトリパスを生成
  String subDirectoryName = "shouts";

  // タイムスタンプを生成
  int timestamp = DateTime.now().millisecondsSinceEpoch;

  // ストレージへの参照を生成
  final StorageReference ref = storage
      .ref()
      .child(subDirectoryName)
      .child('${timestamp}');

  // ストレージへ画像を保存するタスクを生成
  final StorageUploadTask uploadTask = ref.putData(
      file,
      StorageMetadata(
        contentType: "image/jpeg",
      ));

  // タスクを実行
  StorageTaskSnapshot snapshot = await uploadTask.onComplete;

  // 画像のURLを返す
  if (snapshot.error == null) {
    return await snapshot.ref.getDownloadURL();
  }

  // エラーをハンドリング
  switch (snapshot.error) {
    case StorageError.unknown:
    // something
    case StorageError.objectNotFound:
    // something
    case StorageError.bucketNotFound:
    // something
    case StorageError.projectNotFound:
    // something
    case StorageError.quotaExceeded:
    // something
    case StorageError.notAuthenticated:
    // something
    case StorageError.notAuthorized:
    // something
    case StorageError.retryLimitExceeded:
    // something
    case StorageError.invalidChecksum:
    // something
    case StorageError.canceled:
    // something
  }
  return null;

}