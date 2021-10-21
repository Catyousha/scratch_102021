import 'package:cloud_firestore/cloud_firestore.dart';

enum ResponseType {
  success,
  error,
}

class ServiceResponse {
  ResponseType type;
  String message;
  DocumentReference<Object?>? docRef;

  ServiceResponse({
    required this.type,
    required this.message,
    this.docRef,
  });
}
