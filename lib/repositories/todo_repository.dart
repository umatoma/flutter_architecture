import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_architecture/models/todo.dart';
import 'package:flutter_architecture/repositories/base_repository.dart';

class TodoRepository with FirestoreMixin {
  Stream<List<Todo>> getList(String userID) {
    return collection('/users/$userID/todos').snapshots().map(
          (QuerySnapshot query) => query.docs
              .map((QueryDocumentSnapshot doc) => _toModel(doc))
              .toList(),
        );
  }

  Future<String> create(String userID, Todo todo) async {
    final dynamic data = _toData(todo);
    return await collection('users/$userID/todos')
        .add(data)
        .then((DocumentReference ref) => ref.id);
  }

  Todo _toModel(DocumentSnapshot doc) {
    final dynamic data = doc.data();
    return Todo(
      body: data['body'] as String,
      createdAt: (data['createdAt'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> _toData(Todo todo) {
    return <String, dynamic>{
      'body': todo.body,
      'createdAt': Timestamp.now(),
    };
  }
}
