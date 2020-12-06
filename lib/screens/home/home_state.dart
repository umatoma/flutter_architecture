import 'package:flutter_architecture/libs/locator.dart';
import 'package:flutter_architecture/models/current_user.dart';
import 'package:flutter_architecture/models/todo.dart';
import 'package:flutter_architecture/repositories/todo_repository.dart';
import 'package:flutter_architecture/states/base_state.dart';

class HomeState extends BaseState {
  HomeState() {
    user = authRepo.getCurrentUser();
    fetchTodos();
  }

  final TodoRepository _todoRepo = locator<TodoRepository>();

  CurrentUser user;
  List<Todo> todos = [];

  Future<void> fetchTodos() async {
    try {
      setIsProcessing(true);
      todos = await _todoRepo.getList(user.id).first;
      print(todos.length);
      print(todos.map((e) => e.id).join(','));
      notifyListeners();
    } catch (e, stackTrace) {
      setError(e, stackTrace);
    } finally {
      setIsProcessing(false);
    }
  }

  Future<void> onTapCreate() async {
    try {
      await appRoutes.todoCreate().push();
      await fetchTodos();
    } catch (e, stackTrace) {
      setError(e, stackTrace);
    }
  }

  Future<void> signOut() async {
    try {
      await authRepo.signOut();
      await appRoutes.singIn().replace();
    } catch (e, stackTrace) {
      setError(e, stackTrace);
    }
  }
}
