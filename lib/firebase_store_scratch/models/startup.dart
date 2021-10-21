import 'package:cloud_firestore/cloud_firestore.dart';

class Startup {
  String? id;
  String? name;
  String? founderName;
  DateTime? dateFounded;

  Startup({
    this.id,
    this.name,
    this.founderName,
    this.dateFounded,
  });

  String get showDateFounded {
    String dd = "${dateFounded?.day ?? '--'}";
    String mm = "${dateFounded?.month ?? '--'}";
    String yyyy = "${dateFounded?.year ?? '--'}";
    return "$dd/$mm/$yyyy";
  }

  factory Startup.fromDocument(QueryDocumentSnapshot<Object?> doc) {
    return Startup(
      id: doc.id,
      name: doc['name'],
      founderName: doc['founder_name'],
      dateFounded: doc['date_founded'].toDate(),
    );
  }

  Startup copyWith({
    String? id,
    String? name,
    String? founderName,
    DateTime? dateFounded,
  }) {
    return Startup(
      id: id ?? this.id,
      name: name ?? this.name,
      founderName: founderName ?? this.founderName,
      dateFounded: dateFounded ?? this.dateFounded,
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
