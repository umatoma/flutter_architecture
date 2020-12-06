import 'package:flutter/material.dart';
import 'package:flutter_architecture/screens/todo_create/todo_create_state.dart';
import 'package:provider/provider.dart';

class TodoCreateScreen extends StatelessWidget {
  const TodoCreateScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TodoCreateState()),
      ],
      child: const TodoCreateBody(),
    );
  }
}

class TodoCreateBody extends StatelessWidget {
  const TodoCreateBody({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TodoCreateState state = context.watch<TodoCreateState>();

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SizedBox(
          width: 500,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                initialValue: state.body,
                onChanged: (value) => state.onBodyChanged(value),
              ),
              SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => state.onSubmit(),
                  child: Text('Submit'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
