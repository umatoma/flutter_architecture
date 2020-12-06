import 'package:flutter_architecture/states/base_state.dart';

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
    try {
      await authRepo.signUpWithEmailAndPassword(email, password);
      await appRoutes.home().replace();
    } catch (e, stackTrace) {
      setError(e, stackTrace);
    }
  }

  Future<void> signIn() async {
    try {
      await authRepo.signInWithEmailAndPassword(email, password);
      await appRoutes.home().replace();
    } catch (e, stackTrace) {
      setError(e, stackTrace);
    }
  }
}
