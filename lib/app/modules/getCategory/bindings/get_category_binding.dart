import 'package:get/get.dart';

import '../controllers/get_category_controller.dart';

class GetCategoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GetCategoryController>(
      () => GetCategoryController(),
    );
  }
}
