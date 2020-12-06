import 'package:flutter/material.dart';
import 'package:flutter_architecture/models/current_user.dart';
import 'package:flutter_architecture/models/todo.dart';
import 'package:flutter_architecture/screens/home/home_state.dart';
import 'package:flutter_architecture/widgets/processing_container.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeState()),
      ],
      child: const HomeScreenBody(),
    );
  }
}

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeState state = context.watch<HomeState>();
    final CurrentUser user = state.user;

    return Scaffold(
      appBar: AppBar(
        title: Text(user.email),
        actions: [
          IconButton(
            onPressed: () => state.signOut(),
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: ProcessingContainer(
        isProcessing: state.isProcessing,
        child: ListView(
          children: [
            if (state.hasError)
              Text(
                state.error.toString(),
                style: TextStyle(color: Colors.red),
              ),
            ...state.todos.map((Todo todo) {
              return ListTile(
                title: Text(todo.body),
              );
            }).toList(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => state.onTapCreate(),
        child: Icon(Icons.add),
      ),
    );
  }
}
