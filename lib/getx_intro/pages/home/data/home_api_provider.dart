import 'package:get/get.dart';
import '../domain/entity/cases_model.dart';

abstract class IHomeProvider {
  Future<Response<CasesModel>> getCases(String path);
}

// pelaku fetching terhadap API
class HomeProvider extends GetConnect implements IHomeProvider {
  
  // otomatis terkonfigurasi saat class didefinisikan
  @override
  void onInit() {
    // pengolahan hasil fetching
    httpClient.defaultDecoder = (val) {
      return CasesModel.fromJson(val as Map<String, dynamic>);
    };

    //inisialisasi baseUrl
    httpClient.baseUrl = 'https://api.covid19api.com';
  }
  
  @override
  Future<Response<CasesModel>> getCases(String path) => get(path);
}
