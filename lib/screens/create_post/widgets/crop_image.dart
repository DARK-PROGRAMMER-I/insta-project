import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:insta_project/utils/colors.dart';

// crop image
Future<File?> cropImage({required File imageFile}) async {
  File? croppedFile = await ImageCropper().cropImage(
      sourcePath: imageFile.path,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio5x4,
      ],
      androidUiSettings: AndroidUiSettings(
          toolbarTitle: 'Customize',
          dimmedLayerColor: Colors.black.withOpacity(0.2),
          hideBottomControls: false,
          toolbarColor: AppColors.mobileBackgroundColor,
          toolbarWidgetColor: Colors.white,
          initAspectRatio: CropAspectRatioPreset.square,
          lockAspectRatio: true),
      iosUiSettings: const IOSUiSettings(
          minimumAspectRatio: 1.0, aspectRatioLockEnabled: true));
  if (croppedFile != null) {
    return croppedFile;
  } else {
    return null;
  }
}