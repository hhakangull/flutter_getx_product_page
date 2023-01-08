import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:getx_example/features1/models/product.dart';

class ShoppingController extends GetxController {
  var productList = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async {
    await Future.delayed(const Duration(seconds: 1));
    var serverResponse = [
      // Example Product Data
      Product(
        id: 1,
        name: "FirstProduct",
        image: "1.jpg",
        description: "First Description",
        price: 30,
      ),
      Product(
        id: 2,
        name: "SecondProduct",
        image: "2.jpg",
        description: "Second Description",
        price: 50,
      ),
      Product(
        id: 3,
        name: "ThirdProduct",
        image: "3.jpg",
        description: "Third Description",
        price: 20,
      ),
      Product(
        id: 4,
        name: "FourthProduct",
        image: "4.jpg",
        description: "Fourth Description",
        price: 10,
      )
    ];

    productList.value = serverResponse;
  }
}
