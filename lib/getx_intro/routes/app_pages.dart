import 'package:get/get.dart';
import '../pages/home/presentation/views/details_view.dart';
import '../pages/home/presentation/views/country_view.dart';
import '../pages/home/bindings/home_binding.dart';
import '../pages/home/presentation/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  static const initial = Routes.home;

  static final routes = [
    GetPage(
      name: Routes.home,
      page: () => const HomeView(),
      binding: HomeBinding(),
      children: [
        GetPage(
          name: Routes.country,
          page: () => const CountryView(),
          children: [
            GetPage(
              name: Routes.details,
              page: () => const DetailsView(),
            ),
          ],
        ),
      ],
    )
  ];
}
