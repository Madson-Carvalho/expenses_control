import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  FirebaseAuth auth = FirebaseAuth.instance;

  register(name, email, password) async {
    try {
      var user = await auth.createUserWithEmailAndPassword(
          email: email, password: password);

      await user.user!.updateDisplayName(name);

      return user;
    } catch (e) {
      rethrow;
    }
  }

  checkUser() async {
    var user = auth.currentUser!.displayName;
    return user;
  }

  login(String email, String password) async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return userCredential.user;
    } catch (e) {
      rethrow;
    }
  }

  sendPasswordResetEmail(String email) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      rethrow;
    }
  }
}