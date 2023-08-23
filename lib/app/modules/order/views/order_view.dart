import 'package:ecom_2/app/constants.dart';
import 'package:ecom_2/app/modules/cart/controllers/cart_controller.dart';
import 'package:ecom_2/app/utils/memoryManagement.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/order_controller.dart';

class OrderView extends GetView<OrderController> {
  const OrderView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('OrderView'),
          centerTitle: true,
        ),
        body: GetBuilder<CartController>(
          builder: (controller) => Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                SizedBox(
                  height: 370,
                  child: ListView.builder(
                      itemCount: controller.cart.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) => CartCard(
                            cartItem: controller.cart[index],
                            index: index,
                          )),
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(color: Colors.white, boxShadow: [
                    BoxShadow(
                      color: Colors.green.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                    ),
                  ]),
                  child: Column(
                    children: [
                      const Text(
                        'Total amount : ',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Obx(() => Text(
                            'Rs. ${controller.total.value}',
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          )),
                      ElevatedButton(
                          onPressed: () {
                            controller.makeOrder();
                          },
                          child: const Text(
                            'Make order',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ))
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            controller
                                .makePayment(MemoryManagement.getOrderID());
                          },
                          child: const Text(
                            'Make payment',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ))
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

class CartCard extends StatelessWidget {
  final CartItem cartItem;
  final int index;
  const CartCard({super.key, required this.cartItem, required this.index});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(OrderController());
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ]),
          margin: const EdgeInsets.only(bottom: 20),
          height: 100,
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Image.network(
                  getImageUrl(cartItem.product.imageUrl),
                  fit: BoxFit.cover,
                  height: double.infinity,
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        cartItem.product.productName ?? '',
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Price : ${cartItem.product.price}',
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'quantity : ${cartItem.quantity}',
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        // Positioned(
        //   right: 0,
        //   child: IconButton(
        //     onPressed: () {
        //       controller.removeproduct(index);
        //     },
        //     icon: const Icon(
        //       Icons.delete_forever_outlined,
        //       color: Colors.red,
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
