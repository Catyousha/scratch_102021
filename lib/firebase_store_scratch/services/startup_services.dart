import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/startup.dart';

class StartupServices {
  CollectionReference startups =
      FirebaseFirestore.instance.collection('startups');

  Future<String> addStartup(Startup data) async {
    try {
      await startups.add(data);
      return 'Success';
    } catch (e) {
      return 'Something went wrong, please try again\nError: $e';
    }
  }

  Future<QuerySnapshot<Object?>?> loadAllStartup() async {
    try {
      return await startups.get();
    } catch (e) {
      return null;
    }
  }

}
