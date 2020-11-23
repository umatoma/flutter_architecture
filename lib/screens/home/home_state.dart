import 'package:flutter_architecture/libs/locator.dart';
import 'package:flutter_architecture/models/todo.dart';
import 'package:flutter_architecture/repositories/todo_repository.dart';
import 'package:flutter_architecture/screens/base_state.dart';

class HomeState extends BaseState {
  final TodoRepository _todoRepo = locator<TodoRepository>();

  List<Todo> todos = [];

  Future<void> fetchTodos() async {
    todos = await _todoRepo.getList();
    notifyListeners();
  }

  Future<void> onTapCreate() async {
    await appRoute.todoCreate().push();
    await fetchTodos();
  }

  Future<void> signOut() async {
    await authRepo.signOut();
    await appRoute.singIn().replace();
  }
}
