import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  final count = 0.obs;

  PageController pageController = PageController();

  void nextPage() {
    pageController.nextPage(
        duration: const Duration(seconds: 1), curve: Curves.easeInOut);
  }

  void logout() {}
}
