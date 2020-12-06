import 'package:flutter/material.dart';
import 'package:flutter_architecture/screens/user_sign_in/sign_in_state.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SignInState()),
      ],
      child: const SignInBody(),
    );
  }
}

class SignInBody extends StatelessWidget {
  const SignInBody({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SignInState state = context.watch<SignInState>();

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
              SizedBox(height: 32),
              if (state.hasError)
                Text(
                  state.error.toString(),
                  style: TextStyle(color: Colors.red),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
