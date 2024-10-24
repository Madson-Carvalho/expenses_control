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
}
