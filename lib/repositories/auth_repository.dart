import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_architecture/models/current_user.dart';

class AuthRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  CurrentUser getCurrentUser() {
    return _userToCurrentUser(_auth.currentUser);
  }

  bool isSignedIn() {
    return _auth.currentUser != null;
  }

  Stream<CurrentUser> authStateChanges() {
    return _auth
        .authStateChanges()
        .map((User user) => _userToCurrentUser(user));
  }

  Future<CurrentUser> signUpWithEmailAndPassword(
    String email,
    String password,
  ) async {
    final UserCredential credential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    return _userToCurrentUser(credential.user);
  }

  Future<CurrentUser> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    final UserCredential credential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    return _userToCurrentUser(credential.user);
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }

  CurrentUser _userToCurrentUser(User user) {
    return user == null
        ? null
        : CurrentUser(
            id: user.uid,
            email: user.email,
          );
  }
}
