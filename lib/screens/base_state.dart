import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_architecture/repositories/auth_repository.dart';
import 'package:flutter_architecture/app_route.dart';
import 'package:flutter_architecture/libs/locator.dart';

class BaseState extends ChangeNotifier {
  final AppRoute appRoute = locator<AppRoute>();
  final AuthRepository authRepo = locator<AuthRepository>();
  final Set<StreamSubscription> subscriptions = {};

  @override
  void dispose() {
    for (final StreamSubscription sub in subscriptions) {
      sub?.cancel();
    }
    super.dispose();
  }

  void addSubscription(StreamSubscription sub) {
    subscriptions.add(sub);
  }
}
