import 'package:get/get.dart';

import '../controllers/search_u_i_controller.dart';

class SearchUIBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchUIController>(
      () => SearchUIController(),
    );
  }
}
