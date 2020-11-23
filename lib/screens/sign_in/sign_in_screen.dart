import 'package:flutter/material.dart';
import 'package:flutter_architecture/screens/sign_in/sign_in_state.dart';
import 'package:flutter_architecture/screens/widgets/state_builder.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StateBuilder<SignInState>(
      create: () => SignInState(),
      builder: (context, state, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text('SignIn'),
          ),
          body: Center(
            child: SizedBox(
              width: 500,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    initialValue: state.email,
                    onChanged: (value) => state.onEmailChanged(value),
                  ),
                  SizedBox(height: 32),
                  TextFormField(
                    initialValue: state.password,
                    onChanged: (value) => state.onPasswordChanged(value),
                  ),
                  SizedBox(height: 32),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => state.singUp(),
                      child: Text('SignUp'),
                    ),
                  ),
                  SizedBox(height: 32),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => state.signIn(),
                      child: Text('SignIn'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
