import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture/screens/home/home_screen.dart';
import 'package:flutter_architecture/screens/todo_create/todo_create_screen.dart';

class AppRoute {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  final FluroRouter router = FluroRouter();
  final String initialRoute = '/';

  final Handler _homeHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return HomeScreen();
    },
  );
  final Handler _todoCreateHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return TodoCreateScreen();
    },
  );

  AppRoute() {
    router.define('/', handler: _homeHandler);
    router.define('/todoCreate', handler: _todoCreateHandler);
  }

  Future<dynamic> pushNamed(String routeName, {dynamic arguments}) {
    return navigatorKey.currentState.pushNamed(
      routeName,
      arguments: arguments,
    );
  }

  void pop() {
    return navigatorKey.currentState.pop();
  }

  Future<void> navigateToTodoCreate() {
    return pushNamed('/todoCreate');
  }
}
