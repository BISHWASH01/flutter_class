import 'package:ecom_2/app/modules/addCategory/views/add_category_view.dart';
import 'package:ecom_2/app/modules/cart/views/cart_view.dart';
import 'package:ecom_2/app/modules/getCategory/views/get_category_view.dart';
import 'package:ecom_2/app/modules/home/views/home_view.dart';
import 'package:ecom_2/app/modules/profile/views/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  List<Widget> screens = [
    const HomeView(),
    const ProfileView(),
    const CartView(),
    const AddCategoryView()
  ];
  var currentIndex = 0.obs;
  final count = 0.obs;

  void increment() => count.value++;
}
