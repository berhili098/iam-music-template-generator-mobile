import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_image_gallery_saver/flutter_image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';

enum TextDownloaderEnum {
  downloaded('downloaded'),
  failedToSaveToGallery('failed to save to gallery'),
  permissionDenied('permission denied');

  final String visibleText;
  const TextDownloaderEnum(this.visibleText);
}

class TextDownloaderHelper {
  TextDownloaderHelper._();
  static Future<TextDownloaderEnum> downloadWhatIsGenerated(String text, GlobalKey boundaryKey) async {
    try {
      final boundary = boundaryKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
      final image = await boundary.toImage(pixelRatio: 3.0);
      final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
      final pngBytes = byteData!.buffer.asUint8List();

      final statusPhotos = await Permission.photos.request();
      if (statusPhotos.isGranted) {
        await FlutterImageGallerySaver.saveImage(Uint8List.fromList(pngBytes));
        debugPrint("Saved to gallery: ");
        return TextDownloaderEnum.downloaded;
      } else {
        debugPrint("Permission denied: $statusPhotos");
        return TextDownloaderEnum.permissionDenied;
      }
    } catch (e) {
      debugPrint("Error saving image: $e");
      return TextDownloaderEnum.failedToSaveToGallery;
    }
  }
}
