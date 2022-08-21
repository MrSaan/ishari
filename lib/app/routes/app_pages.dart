import 'package:get/get.dart';

import '../modules/detail_muhud/bindings/detail_muhud_binding.dart';
import '../modules/detail_muhud/views/detail_muhud_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/introduction/bindings/introduction_binding.dart';
import '../modules/introduction/views/introduction_view.dart';
import '../modules/last_read/bindings/last_read_binding.dart';
import '../modules/last_read/views/last_read_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.INTRODUCTION,
      page: () => const IntroductionView(),
      binding: IntroductionBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_MUHUD,
      page: () => DetailMuhudView(),
      binding: DetailMuhudBinding(),
    ),
    GetPage(
      name: _Paths.LAST_READ,
      page: () => const LastReadView(),
      binding: LastReadBinding(),
    ),
  ];
}
