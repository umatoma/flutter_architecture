import 'package:flutter/material.dart';
import 'package:flutter_architecture/screens/todo_create/todo_create_state.dart';
import 'package:flutter_architecture/screens/widgets/state_builder.dart';

class TodoCreateScreen extends StatelessWidget {
  const TodoCreateScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StateBuilder<TodoCreateState>(
      create: () => TodoCreateState(),
      builder: (BuildContext context, TodoCreateState state, Widget child) {
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
      },
    );
  }
}
