import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/search_u_i_controller.dart';

class SearchUIView extends GetView<SearchUIController> {
  const SearchUIView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SearchUIView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'SearchUIView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
