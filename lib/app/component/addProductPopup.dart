import 'dart:io';

import 'package:ecom_2/app/component/My_button.dart';
import 'package:ecom_2/app/modules/home/controllers/home_controller.dart';
import 'package:ecom_2/app/modules/admin_products/controllers/admin_products_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddProductPopup extends StatefulWidget {
  const AddProductPopup({super.key});

  @override
  State<AddProductPopup> createState() => _AddProductPopupState();
}

class _AddProductPopupState extends State<AddProductPopup> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        builder: (controller) => Dialog(
                child: Padding(
              padding: const EdgeInsets.all(16),
              child: SingleChildScrollView(
                child: Form(
                  key: controller.addProductFormKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'Add Product',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      TextFormField(
                        controller: controller.productNameController,
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                          labelText: "product name",
                          hintText: "name of the product",
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter product product name';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: controller.descriptionController,
                        textInputAction: TextInputAction.next,
                        maxLines: 5,
                        minLines: 3,
                        decoration: const InputDecoration(
                          labelText: "product description",
                          hintText: "description of the product",
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter product product description';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: controller.priceController,
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                          labelText: "product price",
                          hintText: "price of the product",
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter product product price';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      GetBuilder<HomeController>(
                          builder: (controller) => controller.categories == null
                              ? const CircularProgressIndicator()
                              : DropdownButtonFormField(
                                  decoration: const InputDecoration(
                                      border: OutlineInputBorder()),
                                  hint: const Text('Select Category'),
                                  items: controller.categories!
                                      .map((category) => DropdownMenuItem(
                                            value: category.categoryId,
                                            child: Text(
                                                category.categoryTitle ?? ''),
                                          ))
                                      .toList(),
                                  onChanged: (v) {
                                    controller.selectedCategory = v;
                                  })),
                      const SizedBox(
                        height: 16,
                      ),
                      controller.productImage == null ||
                              controller.imageBytes == null
                          ? ElevatedButton(
                              onPressed: controller.onPickImage,
                              child: const Text('Upload Image'))
                          : Image.memory(controller.imageBytes!),
                      const SizedBox(
                        height: 16,
                      ),
                      MyButton(
                        tittle: 'Add Product',
                        onPressed: controller.addProduct,
                      )
                    ],
                  ),
                ),
              ),
            )));
  }
}
