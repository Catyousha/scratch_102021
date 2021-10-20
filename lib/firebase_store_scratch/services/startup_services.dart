import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/startup.dart';

class StartupServices {
  static CollectionReference startups =
      FirebaseFirestore.instance.collection('startups');

  static Future<String> addStartup(Startup data) async {
    try {
      await startups.add(data.toDocument());
      return 'Success';
    } catch (e) {
      return 'Something went wrong, please try again\nError: $e';
    }
  }

  static Future<QuerySnapshot<Object?>?> loadAllStartup() async {
    try {
      return await startups.get();
    } catch (e) {
      return null;
    }
  }
}
