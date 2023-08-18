import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/get_category_controller.dart';

class GetCategoryView extends GetView<GetCategoryController> {
  const GetCategoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(GetCategoryController());
    return Scaffold(
        appBar: AppBar(
          title: const Text('GetCategoryView'),
          centerTitle: true,
        ),
        body: const SafeArea(
          child: Column(
              // children: [
              //   ElevatedButton(
              //       onPressed: controller.getCategory,
              //       child: const Text('Get Categories')),
              //   ListView.builder(
              //       physics: const NeverScrollableScrollPhysics(),
              //       shrinkWrap: true,
              //       itemCount: controller.getCategory().length,
              //       itemBuilder: (context, index) => ListTile(
              //             title: Text(
              //               '${index + 1}, ${categories[index]['title']}',
              //               style: const TextStyle(
              //                   color: Colors.black,
              //                   fontWeight: FontWeight.bold,
              //                   fontSize: 20),
              //             ),
              //             trailing: Text(
              //               '${categories[index]['price']}',
              //               style: const TextStyle(
              //                   color: Colors.green,
              //                   fontWeight: FontWeight.bold,
              //                   fontSize: 20),
              //             ),
              //           ))
              // ],
              ),
        ));
  }
}
