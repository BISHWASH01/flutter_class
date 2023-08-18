import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_category_controller.dart';

class AddCategoryView extends GetView<AddCategoryController> {
  const AddCategoryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AddCategoryController());
    return Scaffold(
        appBar: AppBar(
          title: const Text('AddCategoryView'),
          centerTitle: true,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
              child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 40,
            ),
            child: Form(
                key: controller.addCategoryFormKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: controller.categoryController,
                      decoration: const InputDecoration(
                        labelText: 'Category name',
                        hintText: 'Name of category',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    ElevatedButton(
                        onPressed: controller.addCategory,
                        child: const Text('Add Category'))
                  ],
                )),
          )),
        ));
  }
}
