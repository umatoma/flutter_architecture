import 'package:flutter/material.dart';
import 'package:flutter_architecture/screens/auth_state.dart';
import 'package:provider/provider.dart';

class AuthContainer extends StatelessWidget {
  const AuthContainer({
    Key key,
    @required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final AuthState state = context.watch<AuthState>();

    if (state.currentUser == null) {
      return Scaffold(
        body: Center(
          child: Text('Unauthorized'),
        ),
      );
    }

    return child;
  }
}
