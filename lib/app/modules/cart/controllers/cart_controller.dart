import 'dart:convert';

import 'package:ecom_2/app/model/product.dart';
import 'package:ecom_2/app/utils/memoryManagement.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecom_2/app/constants.dart';
import 'package:http/http.dart' as http;

class CartController extends GetxController {
  List<CartItem> cart = [];
  var total = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    mapCart();
  }

  final count = 0.obs;

  void increment() => count.value++;

  void addProductCart({required Product product, int? quantity}) {
    if (cart.any((element) => element.product.productId == product.productId)) {
      Get.showSnackbar(const GetSnackBar(
        backgroundColor: Colors.red,
        message: 'Product already in cart!',
        duration: Duration(seconds: 3),
      ));
      return;
    }

    cart.add(CartItem(product: product, quantity: quantity ?? 1));
    updateLocal();
    updatetotal();
    update();
    Get.showSnackbar(const GetSnackBar(
      backgroundColor: Colors.green,
      message: 'Product added successfully!',
      duration: Duration(seconds: 3),
    ));
  }

  void mapCart() {
    var cart =
        jsonDecode(MemoryManagement.getMyCart() ?? '[]') as List<dynamic>;
    this.cart = cart
        .map((e) => CartItem(
            product: Product.fromJson(e['product']), quantity: e['quantity']))
        .toList();
    updatetotal();
  }

  void removeproduct(int index) {
    cart.removeAt(index);
    updateLocal();
    update();
    updatetotal();
  }

  void updateLocal() {
    MemoryManagement.setMyCart(jsonEncode(cart
        .map((e) => {'product': e.product.toJson(), 'quantity': e.quantity})
        .toList()));
  }

  void updatetotal() {
    total.value = 0;
    cart.forEach((element) {
      total.value =
          total.value + double.parse(element.product.price!) * element.quantity;
    });
  }

  Future<void> makeOrder() async {
    var url = Uri.http(ipAddress, 'ecom_API/createOrder');
    var cartOrder = jsonEncode(cart
        .map((e) => {'product': e.product.toJson(), 'quantity': e.quantity})
        .toList());
    var response = await http.post(url, body: {
      'token': MemoryManagement.getAccessToken(),
      'cart': cartOrder,
      'total': total.toString()
    });

    var result = jsonDecode(response.body);

    if (result['success']) {
      MemoryManagement.setOrderID(result['data']);
      Get.showSnackbar(const GetSnackBar(
        backgroundColor: Colors.green,
        message: 'Product ordering successful',
        duration: Duration(seconds: 3),
      ));
    } else {
      Get.showSnackbar(GetSnackBar(
        backgroundColor: Colors.red,
        message: result['message'],
        duration: const Duration(seconds: 3),
      ));
    }
  }
}

class CartItem {
  final Product product;
  final int quantity;

  CartItem({required this.product, this.quantity = 1});
}
