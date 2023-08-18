// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:typed_data';
import 'package:ecom_2/app/component/addProductPopup.dart';

import 'package:ecom_2/app/constants.dart';
import 'package:ecom_2/app/model/category.dart';
import 'package:ecom_2/app/model/product.dart';
import 'package:ecom_2/app/routes/app_pages.dart';
import 'package:ecom_2/app/utils/memoryManagement.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

// import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  final count = 0.obs;
  // late final SharedPreferences prefs;
  List<Category>? categories;
  List<Product>? products;
  String? selectedCategory;
  final ImagePicker picker = ImagePicker();
  var addProductFormKey = GlobalKey<FormState>();

  XFile? productImage;
  Uint8List? imageBytes;

  var productNameController = TextEditingController();
  var descriptionController = TextEditingController();
  var priceController = TextEditingController();

  void increment() => count.value++;

  @override
  void onInit() async {
    super.onInit();
    // prefs = await SharedPreferences.getInstance();
    getCategory();
    getProduct();
  }

  void onPickImage() async {
    try {
      productImage = await picker.pickImage(source: ImageSource.gallery);
      imageBytes = await productImage!.readAsBytes();
      update();
    } catch (e) {
      print(e);
    }
  }

  void addProduct() async {
    try {
      if (addProductFormKey.currentState!.validate()) {
        try {
          print('1');
          var url = Uri.http(ipAddress, 'ecom_API/addProduct');
          var request = http.MultipartRequest('POST', url);

          request.fields['productName'] = productNameController.text;
          request.fields['productDescription'] = descriptionController.text;
          request.fields['price'] = priceController.text;
          request.fields['category'] = selectedCategory!;
          request.fields['token'] = MemoryManagement.getAccessToken()!;
          print('2');

          request.files.add(
            http.MultipartFile.fromBytes(
              'image',
              imageBytes!,
              filename: productImage!.name,
            ),
          );
          print('3');

          var responseData = await request.send();
          var response = await http.Response.fromStream(responseData);
          print(response.body);
          var result = jsonDecode(response.body);
          print('5');

          if (result['success']) {
            Get.back();
            getProduct();
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
          Get.showSnackbar(const GetSnackBar(
            backgroundColor: Colors.red,
            message: 'something went wrong',
            duration: Duration(seconds: 3),
          ));
        }
      }
    } catch (e) {}
  }

  void onLogout() async {
    // await prefs.remove('token');
    MemoryManagement.removeAll();
    Get.offAllNamed(Routes.LOGIN);
  }

  void getCategory() async {
    try {
      var url = Uri.http(ipAddress, 'ecom_API/getCategory');
      var response = await http.get(
        url,
      );

      var result = jsonDecode(response.body);
      // var categories = result['message'];

      if (result['success']) {
        // Get.showSnackbar(GetSnackBar(
        //   backgroundColor: Colors.green,
        //   message: result['message'],
        //   duration: const Duration(seconds: 3),
        // ));
        categories = categoryFromJson(jsonEncode(result['categories']));
        // categories = categoryFromJson(jsonEncode(result['categories']));
        update();

        // return categories;
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

  void getProduct() async {
    try {
      var url = Uri.http(ipAddress, 'ecom_API/getProduct');
      var response = await http.get(url);
      print(response.body);
      var result = jsonDecode(response.body);

      if (result['Success']) {
        Get.showSnackbar(GetSnackBar(
          backgroundColor: Colors.green,
          message: result['message'],
          duration: const Duration(seconds: 3),
        ));
        products = productFromJson(jsonEncode(result['products']));
        update();
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
        message: 'something went wrong',
        duration: Duration(seconds: 3),
      ));
    }
  }
}
