import 'dart:convert';

import 'package:ecom_2/app/constants.dart';
import 'package:ecom_2/app/model/product.dart';
import 'package:ecom_2/app/modules/cart/controllers/cart_controller.dart';
import 'package:ecom_2/app/utils/memoryManagement.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class OrderController extends GetxController {
  List<OrderItem> cart = [];
  var total = 0.0.obs;
  @override
  void onInit() {
    super.onInit();
    mapOrder();
  }

  Future<void> mapOrder() async {
    var url = Uri.http(ipAddress, 'ecom_API/getOrder');

    var response = await http.post(url, body: {
      'token': MemoryManagement.getAccessToken(),
      'orderID': MemoryManagement.getOrderID().toString()
    });
    var result = jsonDecode(response.body);
    if (result['Success']) {
      Get.showSnackbar(GetSnackBar(
        backgroundColor: Colors.green,
        message: result['message'],
        duration: const Duration(seconds: 3),
      ));
      // products = productFromJson(jsonEncode(result['products']));
      update();

      var cart =
          //  result['orders'] ?? [];
          jsonDecode(jsonEncode(['orders'])) as List<dynamic>;
      this.cart = cart
          .map((e) => OrderItem(
              product: Product.fromJson(e['product']), quantity: e['quantity']))
          .toList();
      // updatetotal();
    }
  }
}

class OrderItem {
  final Product product;
  final int quantity;

  OrderItem({required this.product, this.quantity = 1});
}
