import 'dart:convert';

import 'package:ecom_2/app/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AddCategoryController extends GetxController {
  late final SharedPreferences prefs;
  GlobalKey<FormState> addCategoryFormKey = GlobalKey<FormState>();
  var categoryController = TextEditingController();
  final count = 0.obs;

  void increment() => count.value++;
  @override
  void onInit() async {
    super.onInit();
    prefs = await SharedPreferences.getInstance();
  }

  Future<void> addCategory() async {
    try {
      var url = Uri.http(ipAddress, 'ecom_API/addCategory');
      print(url);
      var response = await http.post(url, body: {
        'title': categoryController.text,
        'token': prefs.getString('token')
      });
      print(response.body);

      var result = jsonDecode(response.body);

      if (result['success']) {
        print('added');
        Get.showSnackbar(GetSnackBar(
          backgroundColor: Colors.green,
          message: result['message'],
          duration: const Duration(seconds: 3),
        ));
      } else {
        Get.showSnackbar(GetSnackBar(
          backgroundColor: Colors.red,
          message: result['message'],
          duration: const Duration(seconds: 3),
        ));
      }
    } catch (e) {
      print(e.toString());
      Get.showSnackbar(const GetSnackBar(
        backgroundColor: Colors.red,
        message: 'Something went wrong',
        duration: Duration(seconds: 3),
      ));
    }
  }

  // _tokenRetriever() {
  //   final token = prefs.getString('token');
  //   return token;
  // }
}
