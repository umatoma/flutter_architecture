import 'package:flutter/material.dart';
import 'package:flutter_architecture/models/current_user.dart';
import 'package:flutter_architecture/models/todo.dart';
import 'package:flutter_architecture/screens/auth_state.dart';
import 'package:flutter_architecture/screens/home/home_state.dart';
import 'package:flutter_architecture/screens/widgets/state_builder.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StateBuilder<HomeState>(
      create: () => HomeState(),
      onStateCreated: (HomeState state) async {
        await state.fetchTodos();
      },
      builder: (BuildContext context, HomeState state, Widget child) {
        final AuthState authState = context.watch<AuthState>();
        final CurrentUser currentUser = authState.currentUser;

        return Scaffold(
          appBar: AppBar(
            title: Text(currentUser.email),
            actions: [
              IconButton(
                onPressed: () => state.signOut(),
                icon: Icon(Icons.logout),
              ),
            ],
          ),
          body: ListView(
            children: state.todos.map((Todo todo) {
              return ListTile(
                title: Text(todo.body),
              );
            }).toList(),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => state.onTapCreate(),
            child: Icon(Icons.add),
          ),
        );
      },
    );
  }
}
