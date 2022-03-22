import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:passengers/client/appwrite.dart';

class AuthenticationService {
  Account account = Account(getClient());

  logout({required Session session}) async {
    await account.deleteSession(sessionId: session.$id);
  }

  Future<Session> register({
    required String email,
    required String password,
  }) async {
    try {
      await account.create(
        userId: 'unique()',
        email: email,
        password: password,
      );
      return await login(email: email, password: password);
    } on AppwriteException catch (e) {
      print(e);
      throw Exception(e.message);
    }
  }

  Future<Session> login({
    required String email,
    required String password,
  }) async {
    try {
      Session session = await account.createSession(
        email: email,
        password: password,
      );
      return session;
    } on AppwriteException catch (e) {
      print(e);
      throw Exception(e.message);
    }
  }
}
