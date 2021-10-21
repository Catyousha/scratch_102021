import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/service_response.dart';
import '../models/startup.dart';

class StartupServices {
  static String okStatus = 'Success';
  static String errorStatus(e) {
    return 'Something went wrong, please try again\nError: $e';
  }

  static CollectionReference startups =
      FirebaseFirestore.instance.collection('startups');

  static Future<ServiceResponse> addStartup(Startup data) async {
    return await startups.add(data.toDocument()).then((docRef) {
      return ServiceResponse(
        type: ResponseType.success,
        docRef: docRef,
        message: okStatus,
      );
    }).catchError((e) {
      return ServiceResponse(
        type: ResponseType.error,
        message: errorStatus(e),
      );
    });
  }

  static Future<ServiceResponse> editStartup(Startup data) async {
    return await startups.doc(data.id).set(data.toDocument()).then((docRef) {
      return ServiceResponse(
        type: ResponseType.success,
        message: okStatus,
      );
    }).catchError((e) {
      return ServiceResponse(
        type: ResponseType.error,
        message: errorStatus(e),
      );
    });
  }

  static Future<ServiceResponse> deleteStartup(Startup data) async {
    return await startups.doc(data.id).delete().then((docRef) {
      return ServiceResponse(
        type: ResponseType.success,
        message: okStatus,
      );
    }).catchError((e) {
      return ServiceResponse(
        type: ResponseType.error,
        message: errorStatus(e),
      );
    });
  }

  static Future<QuerySnapshot<Object?>?> loadAllStartup() async {
    try {
      return await startups.orderBy('name').get();
    } catch (e) {
      return null;
    }
  }
}
