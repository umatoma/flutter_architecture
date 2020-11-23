import 'package:flutter/material.dart';
import 'package:flutter_architecture/app_route.dart';
import 'package:flutter_architecture/libs/locator.dart';
import 'package:flutter_architecture/repositories/auth_repository.dart';
import 'package:flutter_architecture/repositories/todo_repository.dart';
import 'package:flutter_architecture/screens/auth_state.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

void initializeLocators() {
  locator.registerSingleton<AuthRepository>(AuthRepository());
  locator.registerSingleton<TodoRepository>(TodoRepository());
  locator.registerSingleton<AppRoute>(AppRoute());
}

class App extends StatefulWidget {
  const App({Key key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final AuthRepository authRepo = locator<AuthRepository>();
  final AppRoute appRouter = locator<AppRoute>();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: <SingleChildWidget>[
        ChangeNotifierProvider(create: (_) => AuthState())
      ],
      child: MaterialApp(
        navigatorKey: appRouter.navigatorKey,
        title: 'Flutter Architecture',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // initialRoute: appRouter.initialRoute,
        onGenerateRoute: appRouter.router.generator,
      ),
    );
  }
}
