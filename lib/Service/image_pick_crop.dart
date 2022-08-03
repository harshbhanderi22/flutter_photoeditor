import 'dart:io';

import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class Utils {
  Utils._();

  /// Open image gallery and pick an image
  static Future<File?> pickImageFromGallery() async {
    final XFile? pickedimage=await ImagePicker().pickImage(source: ImageSource.gallery);
    final File file = File(pickedimage!.path);
    return file;
  }

  static Future<File?> pickImageFromCamera() async {
    final XFile? pickedimage=await ImagePicker().pickImage(source:
    ImageSource.camera);
    final File file = File(pickedimage!.path);
    return file;
  }

  /// Pick Image From Gallery and return a File
  static Future<File?> cropSelectedImage(String filePath) async {
    final CroppedFile? croppedfileimage=  await ImageCropper().cropImage(
      sourcePath: filePath,
      aspectRatio: const CropAspectRatio(ratioX: 1.0, ratioY: 1.0),
    );
    final File file = File(croppedfileimage!.path);
    return file;

  }
}