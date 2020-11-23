import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture/screens/home/home_screen.dart';
import 'package:flutter_architecture/screens/sign_in/sign_in_screen.dart';
import 'package:flutter_architecture/screens/todo_create/todo_create_screen.dart';
import 'package:flutter_architecture/screens/widgets/auth_container.dart';

class AppRoute {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  final FluroRouter router = FluroRouter();
  final String initialRoute = '/';

  final Handler _homeHandler = Handler(
    handlerFunc: (_, Map<String, List<String>> params) {
      return AuthContainer(child: const HomeScreen());
    },
  );
  final Handler _singInHandler = Handler(
    handlerFunc: (_, Map<String, List<String>> params) {
      return const SignInScreen();
    },
  );
  final Handler _todoCreateHandler = Handler(
    handlerFunc: (_, Map<String, List<String>> params) {
      return AuthContainer(child: const TodoCreateScreen());
    },
  );

  AppRoute() {
    router.define('/', handler: _homeHandler);
    router.define('/users/signIn', handler: _singInHandler);
    router.define('/todos/new', handler: _todoCreateHandler);
  }

  RouteNav home() => RouteNav('/', this);
  RouteNav singIn() => RouteNav('/users/signIn', this);
  RouteNav todoCreate() => RouteNav('/todos/new', this);

  Future<dynamic> pushNamed(String route, {dynamic arguments}) {
    return navigatorKey.currentState.pushNamed(
      route,
      arguments: arguments,
    );
  }

  Future<dynamic> pushReplacementNamed(String route, {dynamic arguments}) {
    return navigatorKey.currentState.pushReplacementNamed(
      route,
      arguments: arguments,
    );
  }

  void pop() {
    return navigatorKey.currentState.pop();
  }
}

class RouteNav {
  RouteNav(this.route, this.appRoute);

  final String route;
  final AppRoute appRoute;

  Future<dynamic> push({dynamic arguments}) {
    return appRoute.pushNamed(route, arguments: arguments);
  }

  Future<dynamic> replace({dynamic arguments}) {
    return appRoute.pushReplacementNamed(route, arguments: arguments);
  }
}
