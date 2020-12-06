import 'package:flutter_architecture/libs/locator.dart';
import 'package:flutter_architecture/models/current_user.dart';
import 'package:flutter_architecture/models/todo.dart';
import 'package:flutter_architecture/repositories/todo_repository.dart';
import 'package:flutter_architecture/states/base_state.dart';

class TodoCreateState extends BaseState {
  TodoCreateState() {
    user = authRepo.getCurrentUser();
  }

  final TodoRepository _todoRepo = locator<TodoRepository>();

  CurrentUser user;
  String body = '';

  void onBodyChanged(String value) {
    body = value;
    notifyListeners();
  }

  Future<void> onSubmit() async {
    try {
      final Todo todo = Todo(
        body: body,
        createdAt: DateTime.now(),
      );
      await _todoRepo.create(user.id, todo);
      appRoutes.pop();
    } catch (e, stackTrace) {
      setError(e, stackTrace);
    }
  }
}
