import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:passengers/client/appwrite.dart';
import 'package:passengers/constants/collections.dart';
import 'package:passengers/models/profile.model.dart';

class ProfileService {
  Account account = Account(getClient());

  createProfile({required Profile profile, required String userId}) async {
    print('userId $userId');
    try {
      await database().createDocument(
        collectionId: profileCollectionId,
        documentId: userId,
        data: profile.toMap(),
      );
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  updateUserName({required String name}) async {
    try {
      await account.updateName(name: name);
    } catch (e) {
      print('Update name error $e');
      throw Exception('Unable to update name');
    }
  }
}
