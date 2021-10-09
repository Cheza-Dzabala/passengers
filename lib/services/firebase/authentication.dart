import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService {
  FirebaseAuth _auth = FirebaseAuth.instance;

  signupEmailPassword({required String email, required String password}) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      print(e);
      throw new Exception('Registration Error');
    }
  }

  login({required String email, required String password}) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      print('Sign in error $e');
      throw new Exception('Login Error');
    }
  }

  resetPassword({required String email}) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      print('Recover password error $e');
      throw new Exception('Recover password Error');
    }
  }

  logout() async {
    try {
      await _auth.signOut();
    } catch (e) {
      print('Logout error $e');
      throw new Exception('Logout Error');
    }
  }
}
