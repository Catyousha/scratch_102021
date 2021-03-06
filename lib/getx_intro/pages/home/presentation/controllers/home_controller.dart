import 'package:get/get.dart';
import '../../domain/adapters/repository_adapter.dart';
import '../../domain/entity/cases_model.dart';

class HomeController extends SuperController<CasesModel> {
  HomeController({required this.homeRepository});
  final IHomeRepository homeRepository;
  @override
  void onInit() {
    super.onInit();

    // mirip seperti emit di bloc
    // menjadikan CasesModel hasil fetching sebagai state
    append(() => homeRepository.getCases);
  }

  // method custom yang bisa dipanggil dari controller
  Country getCountryById(String id) {
    final idx = int.tryParse(id);
    if (idx != null) {
      return state!.countries[idx];
    }
    return state!.countries.first;
  }

  // bunch of native event handling
  // such niche, much niche
  @override
  void onReady() {
    print('The build method is done. '
        'Your controller is ready to call dialogs and snackbars');
    super.onReady();
  }

  @override
  void onClose() {
    print('onClose called');
    super.onClose();
  }

  @override
  void didChangeMetrics() {
    print('the window size did change');
    super.didChangeMetrics();
  }

  @override
  void didChangePlatformBrightness() {
    print('platform change ThemeMode');
    super.didChangePlatformBrightness();
  }

  @override
  Future<bool> didPushRoute(String route) {
    print('the route $route will be open');
    return super.didPushRoute(route);
  }

  @override
  Future<bool> didPopRoute() {
    print('the current route will be closed');
    return super.didPopRoute();
  }

  @override
  void onDetached() {
    print('onDetached called');
  }

  @override
  void onInactive() {
    print('onInative called');
  }

  @override
  void onPaused() {
    print('onPaused called');
  }

  @override
  void onResumed() {
    print('onResumed called');
  }
}


