import 'dart:convert';

import 'package:ecom_2/app/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'package:shared_preferences/shared_preferences.dart';

class GetCategoryController extends GetxController {
  late final SharedPreferences prefs;
  var productController = TextEditingController();
  var productDescController = TextEditingController();
  var productPriceController = TextEditingController();
  var productURLController = TextEditingController();

  @override
  void onInit() async {
    super.onInit();
    prefs = await SharedPreferences.getInstance();
  }

  getCategory() async {
    try {
      var url = Uri.http(ipAddress, 'ecom_API/getCategory');
      var response =
          await http.post(url, body: {'token': prefs.getString('token')});

      var result = jsonDecode(response.body);
      var categories = result['message'];

      if (result['success']) {
        Get.showSnackbar(GetSnackBar(
          backgroundColor: Colors.green,
          message: result['message'],
          duration: const Duration(seconds: 3),
        ));
        return categories;
      } else {
        Get.showSnackbar(GetSnackBar(
          backgroundColor: Colors.red,
          message: result['message'],
          duration: const Duration(seconds: 3),
        ));
        return null;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  addProduct() async {
    try {
      var url = Uri.http(ipAddress, 'ecom_API/addProduct');
      var response = await http.post(url, body: {
        'token': prefs.getString('token'),
        'productName': productController.text,
        'category': prefs.getString('category'),
        'productDescription': productDescController.text,
        'price': productPriceController.text,
        'isInStock': true,
        // 'imageUrl': productURLController.text
      });

      print(response.body);

      var result = jsonDecode(response.body);
    } catch (e) {
      print(e.toString());
    }
  }
}
