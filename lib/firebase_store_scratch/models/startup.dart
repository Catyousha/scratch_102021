import 'package:cloud_firestore/cloud_firestore.dart';

class Startup {
  String? name;
  String? founderName;
  DateTime? dateFounded;

  Startup({
    this.name,
    this.founderName,
    this.dateFounded,
  });

  factory Startup.fromDocument(QueryDocumentSnapshot<Object?> doc) {
    return Startup(
      name: doc['name'],
      founderName: doc['founder_name'],
      dateFounded: doc['date_founded'].toDate(),
    );
  }

  Map<String, dynamic> toDocument() {
    return {
      'name': name,
      'founder_name': founderName,
      'date_founded': dateFounded,
    };
  }
}
