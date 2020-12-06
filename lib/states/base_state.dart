import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_architecture/repositories/auth_repository.dart';
import 'package:flutter_architecture/app_routes.dart';
import 'package:flutter_architecture/libs/locator.dart';

class BaseState extends ChangeNotifier {
  @protected
  final AppRoutes appRoutes = locator<AppRoutes>();

  @protected
  final AuthRepository authRepo = locator<AuthRepository>();

  @protected
  final Set<StreamSubscription> subscriptions = {};

  bool isProcessing = false;
  Object error;

  bool get hasError => error != null;

  @override
  void dispose() {
    for (final StreamSubscription sub in subscriptions) {
      sub?.cancel();
    }
    super.dispose();
  }

  @protected
  void addSubscription(StreamSubscription sub) {
    subscriptions.add(sub);
  }

  @protected
  void setError(Object e, StackTrace stackTrace) {
    error = e;
    notifyListeners();
  }

  @protected
  void setIsProcessing(bool value) {
    isProcessing = value;
    notifyListeners();
  }
}
