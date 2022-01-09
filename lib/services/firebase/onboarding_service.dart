import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class OnboardingService {
  Future<String> uploadAvatar({required File file}) async {
    final user = FirebaseAuth.instance.currentUser!.uid;
    String storagePath = 'avatars/$user/';
    String filename = FirebaseStorage.instance.ref().child(storagePath).name;
    var storageReference =
        FirebaseStorage.instance.ref().child(storagePath).child(filename);

    try {
      var task = await storageReference.putFile(file);
      var downloadUrl = await task.ref.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      print('File upload error $e');
      throw new Exception('Failed to upload file');
    }
  }
}
