import 'package:get/get.dart';

import '../controllers/detail_muhud_controller.dart';

class DetailMuhudBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailMuhudController>(
      () => DetailMuhudController(),
    );
  }
}
