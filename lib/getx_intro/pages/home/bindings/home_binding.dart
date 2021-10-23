import 'package:get/get.dart';
import 'package:scratch_102021/getx_intro/pages/home/data/home_repository.dart';
import 'package:scratch_102021/getx_intro/pages/home/presentation/controllers/home_controller.dart';
import '../domain/adapters/repository_adapter.dart';
import '../data/home_api_provider.dart';

// dependecy injection untuk penggunaan secara global
class HomeBinding extends Bindings {

  @override
  void dependencies() {
    // akan dibentuk jika laman yang membutuhkannya diakses
    // varian IHomeProvider yang digunakan ialah HomeProvider
    Get.lazyPut<IHomeProvider>(() => HomeProvider());

    // varian IHomeRepository yang digunakan ialah HomeRepository
    // Get.find() otomatis mencari varian IHomeProvider yang digunakan == HomeProvider
    Get.lazyPut<IHomeRepository>(() => HomeRepository(provider: Get.find()));

    // varian HomeController yang digunakan ialah HomeController
    Get.lazyPut(() => HomeController(homeRepository: Get.find()));
  }
}
