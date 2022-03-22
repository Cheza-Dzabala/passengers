import 'dart:math';
import 'dart:typed_data';

import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:image_picker/image_picker.dart';
import 'package:passengers/client/appwrite.dart';
import 'package:passengers/constants/buckets.dart';

String getFileExtension(String fileName) {
  return "." + fileName.split('.').last;
}

class FileUploadService {
  Future<Uint8List> getImage({required String fileId}) async {
    return await storage().getFileView(bucketId: imageBucket, fileId: fileId);
  }

  Future<File> uploadImage({required XFile image}) async {
    final int randomNumber = Random().nextInt(10000);
    try {
      File result = await storage().createFile(
        bucketId: imageBucket,
        fileId: randomNumber.toString(),
        file: InputFile(path: image.path, filename: image.name),
      );
      return result;
    } catch (error) {
      print(error);
      throw Exception('Upload error');
    }
  }
}
