import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture/screens/home/home_screen.dart';
import 'package:flutter_architecture/screens/user_sign_in/sign_in_screen.dart';
import 'package:flutter_architecture/screens/todo_create/todo_create_screen.dart';
import 'package:flutter_architecture/widgets/auth_container.dart';

class AppRoutes {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  final FluroRouter router = FluroRouter();
  final RouteHandlers handlers = RouteHandlers();
  final String initialRoute = '/';

  AppRoutes() {
    _define('/', handlers.home);
    _define('/users/signIn', handlers.signIn);
    _define('/todos/new', handlers.todoCreate);
    _defineNotFound(handlers.notFound);
  }

  RouteNav home() => _toNav('/');
  RouteNav singIn() => _toNav('/users/signIn');
  RouteNav todoCreate() => _toNav('/todos/new');

  List<Route<dynamic>> generateInitialRoutes(String initialRoute) {
    final Route route = router.matchRoute(null, initialRoute).route;
    return <Route>[route];
  }

  Route<dynamic> generateRoute(RouteSettings settings) {
    return router.generator(settings);
  }

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

  void _define(String route, Handler handler) {
    router.define(route, handler: handler);
  }

  void _defineNotFound(Handler handler) {
    router.notFoundHandler = handler;
  }

  RouteNav _toNav(String route) {
    return RouteNav(route, this);
  }
}

class RouteNav {
  RouteNav(this.route, this.appRoute);

  final String route;
  final AppRoutes appRoute;

  Future<dynamic> push({dynamic arguments}) {
    print(route);
    return appRoute.pushNamed(route, arguments: arguments);
  }

  Future<dynamic> replace({dynamic arguments}) {
    return appRoute.pushReplacementNamed(route, arguments: arguments);
  }
}

class RouteHandlers {
  final Handler home = Handler(
    handlerFunc: (_, Map<String, List<String>> params) {
      return AuthContainer(child: const HomeScreen());
    },
  );
  final Handler signIn = Handler(
    handlerFunc: (_, Map<String, List<String>> params) {
      return const SignInScreen();
    },
  );
  final Handler todoCreate = Handler(
    handlerFunc: (_, Map<String, List<String>> params) {
      return AuthContainer(child: const TodoCreateScreen());
    },
  );
  final Handler notFound = Handler(
    handlerFunc: (_, Map<String, List<String>> params) {
      return AuthContainer(
        child: const Scaffold(
          body: Center(
            child: Text('Not Found'),
          ),
        ),
      );
    },
  );
}
