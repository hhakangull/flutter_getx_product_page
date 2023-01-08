import 'dart:developer';

import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/cart_controller.dart';
import '../controllers/shopping_controller.dart';

class ShoppingView extends StatelessWidget {
  ShoppingView({Key? key}) : super(key: key);

  final shoppingController = Get.put(ShoppingController());
  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: GetX<ShoppingController>(builder: (controller) {
                return ListView.builder(
                  itemCount: controller.productList.length,
                  itemBuilder: ((context, index) {
                    var product = controller.productList[index];
                    return Card(
                      margin: const EdgeInsets.all(12),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      controller.productList[index].name,
                                      style: const TextStyle(
                                        fontSize: 24,
                                      ),
                                    ),
                                    Text(controller
                                        .productList[index].description),
                                  ],
                                ),
                                Text(
                                  '\$${controller.productList[index].price}',
                                  style: const TextStyle(fontSize: 24),
                                )
                              ],
                            ),
                            ElevatedButton(
                              onPressed: () {
                                cartController
                                    .addToCart(controller.productList[index]);
                              },
                              child: const Text('Add To Cart'),
                            ),
                            Obx(
                              () => IconButton(
                                onPressed: () {
                                  try {
                                    product.isFavorite.toggle();
                                    cartController.addFavorite(product);
                                  } catch (e) {
                                    log(e.toString());
                                  }

                                  log(controller.productList[index].isFavorite
                                      .toString());
                                },
                                icon: controller
                                        .productList[index].isFavorite.value
                                    ? const Icon(Icons.favorite)
                                    : const Icon(
                                        Icons.favorite_border_outlined),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
                );
              }),
            ),
            Obx(
              () => Text(
                'Total Amount \$${cartController.totalPrice}',
                style: const TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
            ),
            // GetBuilder<CartController>(builder: ((controller) {
            //   return Text(
            //     'Total Amount ${controller.testAmount}',
            //     style: const TextStyle(
            //       fontSize: 24,
            //       color: Colors.white,
            //     ),
            //   );
            // })),
            // GetX<CartController>(builder: (controller) {
            //   return Text(
            //     'Total Amount :\$ ${controller.totalPrice}',
            //     style: const TextStyle(
            //       fontSize: 24,
            //       color: Colors.white,
            //     ),
            //   );
            // }),
            const SizedBox(height: 80),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        icon: const Icon(Icons.shopping_cart_checkout),
        label: Badge(
          animationType: BadgeAnimationType.slide,
          badgeContent: Obx(() => Text(
                cartController.count.toString(),
                style: const TextStyle(color: Colors.white),
              )),
        ),
      ),
    );
  }
}
