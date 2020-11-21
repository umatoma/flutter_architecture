import 'package:flutter/material.dart';

class Todo {
  Todo({
    @required this.body,
    @required this.createdAt,
  }) : this.id = DateTime.now().millisecondsSinceEpoch.toString();

  final String id;
  final String body;
  final DateTime createdAt;
}
