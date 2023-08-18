import 'package:ecom_2/app/views/views/firstview_view.dart';
import 'package:ecom_2/app/views/views/secondview_view.dart';
import 'package:ecom_2/app/views/views/thirdview_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/onboarding_controller.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller.pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: const [FirstviewView(), SecondView(), ThirdView()],
      ),
    );
  }
}
