import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:photo_view/photo_view.dart';

// --------------------------------
// クラス名 　: ImageDetailPage
// クラス概要 : 画像詳細表示
// --------------------------------
class ImageDetailPage extends StatelessWidget {
  final String path;

  const ImageDetailPage({Key key, this.path}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("画像詳細"),
      ),
      body: Center(
        child: PhotoView(
          imageProvider: NetworkImage(
            path,
          ),
        ),
      ),
    );
  }
}
