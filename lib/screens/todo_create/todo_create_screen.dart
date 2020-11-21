import 'package:flutter/material.dart';
import 'package:flutter_architecture/screens/todo_create/todo_create_state.dart';
import 'package:flutter_architecture/screens/widgets/state_builder.dart';

class TodoCreateScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StateBuilder<TodoCreateState>(
      stateBuilder: () => TodoCreateState(),
      builder: (BuildContext context, TodoCreateState state) {
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
