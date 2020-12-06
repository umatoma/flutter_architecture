import 'package:flutter/material.dart';
import 'package:flutter_architecture/app_routes.dart';
import 'package:flutter_architecture/libs/locator.dart';
import 'package:flutter_architecture/repositories/auth_repository.dart';
import 'package:flutter_architecture/repositories/todo_repository.dart';
import 'package:flutter_architecture/states/auth_state.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

void initializeLocators() {
  locator.registerSingleton<AuthRepository>(AuthRepository());
  locator.registerSingleton<TodoRepository>(TodoRepository());
  locator.registerSingleton<AppRoutes>(AppRoutes());
}

class App extends StatefulWidget {
  const App({Key key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final AuthRepository authRepo = locator<AuthRepository>();
  final AppRoutes appRoutes = locator<AppRoutes>();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: <SingleChildWidget>[
        ChangeNotifierProvider(create: (_) => AuthState())
      ],
      child: MaterialApp(
        navigatorKey: appRoutes.navigatorKey,
        title: 'Flutter Architecture',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: appRoutes.initialRoute,
        onGenerateInitialRoutes: appRoutes.generateInitialRoutes,
        onGenerateRoute: appRoutes.generateRoute,
      ),
    );
  }
}
