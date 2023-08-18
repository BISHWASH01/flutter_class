import 'package:ecom_2/app/modules/home/controllers/home_controller.dart';
import 'package:ecom_2/app/component/adminProductCard.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/admin_products_controller.dart';

class AdminProductsView extends GetView<AdminProductsController> {
  const AdminProductsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AdminProductsController());
    return Scaffold(
        appBar: AppBar(
          title: const Text('AdminProductsView'),
          centerTitle: true,
        ),
        body: GetBuilder<HomeController>(
            init: HomeController(),
            builder: (controller) {
              if (controller.products == null) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return ListView.builder(
                  itemCount: controller.products?.length ?? 0,
                  itemBuilder: (context, index) {
                    return AdminProductCard(
                      product: controller.products![index],
                    );
                  });
            }),
        floatingActionButton: FloatingActionButton(
          onPressed: controller.onAdd,
          child: const Icon(Icons.add),
        ));
  }
}
