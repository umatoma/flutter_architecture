import 'package:flutter/material.dart';
import 'package:flutter_architecture/app_route.dart';
import 'package:flutter_architecture/libs/locator.dart';

class BaseState extends ChangeNotifier {
  final AppRoute appRoute = locator<AppRoute>();
}
