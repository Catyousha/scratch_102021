import 'package:get/get.dart';
import 'package:scratch_102021/getx_intro/pages/home/data/home_repository.dart';
import 'package:scratch_102021/getx_intro/pages/home/presentation/controllers/home_controller.dart';
import '../domain/adapters/repository_adapter.dart';
import '../data/home_api_provider.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IHomeProvider>(() => HomeProvider());
    Get.lazyPut<IHomeRepository>(() => HomeRepository(provider: Get.find()));
    Get.lazyPut(() => HomeController(homeRepository: Get.find()));
  }
}
