import 'package:ecom_2/app/component/product_card.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(HomeController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: GetBuilder<HomeController>(builder: (controller) {
        if (controller.categories == null) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              children: [
                SizedBox(
                  height: 40,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.categories?.length ?? 0,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.only(right: 10),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(100)),
                        child: Center(
                          child: Text(
                            controller.categories?[index].categoryTitle ?? '',
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                controller.products == null
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: controller.products?.length ?? 0,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 0.75,
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                        itemBuilder: (context, index) => SizedBox(
                            width: 200,
                            child: ProductCard(
                                product: controller.products![index])))
              ],
            ),
          ),
        );
      }

          // Obx(
          //   () => Text(
          //     controller.count.value.toString(),
          //     textAlign: TextAlign.center,
          //     style: const TextStyle(
          //       fontWeight: FontWeight.bold,
          //       fontSize: 25,
          //     ),
          //   ),
          // ),
          // ElevatedButton(
          //   onPressed: controller.onLogout,
          //   child: const Text('logout'),
          // )
          ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     controller.increment();
      //   },
      //   child: const Icon(Icons.add),
      // ),
    );
  }
}
