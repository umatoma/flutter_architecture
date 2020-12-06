import 'package:flutter_architecture/models/current_user.dart';
import 'package:flutter_architecture/states/base_state.dart';

class AuthState extends BaseState {
  AuthState() {
    addSubscription(
      authRepo.authStateChanges().listen(_onCurrentUserChanged),
    );
  }

  CurrentUser currentUser;

  void _onCurrentUserChanged(CurrentUser value) {
    currentUser = value;
    notifyListeners();
  }
}
