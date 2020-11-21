import 'package:flutter/material.dart';
import 'package:flutter_architecture/app_auth.dart';
import 'package:flutter_architecture/app_route.dart';
import 'package:flutter_architecture/libs/locator.dart';
import 'package:flutter_architecture/repositories/todo_repository.dart';

void initializeLocators() {
  locator.registerSingleton<AppAuth>(AppAuth());
  locator.registerSingleton<AppRoute>(AppRoute());
  locator.registerSingleton<TodoRepository>(TodoRepository());
}

class App extends StatefulWidget {
  const App({Key key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final AppRoute appRouter = locator<AppRoute>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: appRouter.navigatorKey,
      title: 'Flutter Architecture',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: appRouter.initialRoute,
      onGenerateRoute: appRouter.router.generator,
    );
  }
}
