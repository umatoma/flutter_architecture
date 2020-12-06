import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

mixin FirestoreMixin {
  @protected
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  @protected
  CollectionReference collection(String collectionPath) {
    return firestore.collection(collectionPath);
  }
}
