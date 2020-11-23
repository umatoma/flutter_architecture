import 'package:flutter_architecture/screens/base_state.dart';

class SignInState extends BaseState {
  String email = '';
  String password = '';

  void onEmailChanged(String value) {
    email = value;
    notifyListeners();
  }

  void onPasswordChanged(String value) {
    password = value;
    notifyListeners();
  }

  Future<void> singUp() async {
    await authRepo.signUpWithEmailAndPassword(email, password);
    await appRoute.home().replace();
  }

  Future<void> signIn() async {
    await authRepo.signInWithEmailAndPassword(email, password);
    await appRoute.home().replace();
  }
}
