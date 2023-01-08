import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:getx_example/features2/controllers/product_controller.dart';
import 'package:getx_example/features2/views/product_tile.dart';

class ShopXView extends StatelessWidget {
  ShopXView({Key? key}) : super(key: key);

  final productController = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Badge(
              animationType: BadgeAnimationType.fade,
              animationDuration: const Duration(milliseconds: 500),
              badgeColor: Colors.amber,
              badgeContent: Obx(
                () => Text(
                  productController.basketCount.toString(),
                ),
              ),
              child: const Icon(
                Icons.shopping_cart_rounded,
                color: Colors.black,
              ),
            ),
          )
        ],
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
        ),
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                const Expanded(
                  child: Text(
                    'ShopX',
                    style: TextStyle(
                      fontFamily: 'avenir',
                      fontSize: 32,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    productController.isGridView.value = false;
                  },
                  icon: Obx(
                    () => Icon(productController.isGridView.value == false
                        ? Icons.view_list
                        : Icons.view_list_outlined),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    productController.isGridView.value = true;
                  },
                  icon: Obx(
                    () => Icon(productController.isGridView.value == false
                        ? Icons.grid_view_outlined
                        : Icons.grid_view_rounded),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Obx(() {
              if (productController.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              } else {
                if (!productController.isGridView.value) {
                  return _listProduct();
                }
                return _gridProduct();
              }
            }),
          )
        ],
      ),
    );
  }

  AnimationLimiter _gridProduct() {
    return AnimationLimiter(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 2,
          mainAxisSpacing: 2,
        ),
        itemCount: productController.productList.length,
        itemBuilder: (BuildContext context, int index) {
          var product = productController.productList[index];
          return GestureDetector(
            onTap: () {
              productController.addToBasket(product);
            },
            child: AnimationConfiguration.staggeredList(
              position: index,
              duration: const Duration(milliseconds: 375),
              child: SlideAnimation(
                verticalOffset: 50.0,
                child: FadeInAnimation(
                  child: ProductTile(product),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  AnimationLimiter _listProduct() {
    return AnimationLimiter(
      child: ListView.builder(
        itemCount: productController.productList.length,
        itemBuilder: (context, index) {
          var product = productController.productList[index];
          return GestureDetector(
            onTap: () {
              productController.addToBasket(product);
            },
            child: ProductListTile(product: product),
          );
        },
      ),
    );
  }
}
