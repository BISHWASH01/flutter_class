import 'dart:convert';

import 'package:ecom_2/app/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ProfileController extends GetxController {
  final count = 0.obs;
  late final SharedPreferences prefs;

  @override
  void onInit() async {
    super.onInit();
    prefs = await SharedPreferences.getInstance();
  }

  void increment() => count.value++;

  getProfileURL() async {
    try {
      var url = Uri.http(ipAddress, 'ecom_API/getCategory');
      print(url);
      var response =
          await http.post(url, body: {'token': prefs.getString('token')});
      print(response.body);

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
}
