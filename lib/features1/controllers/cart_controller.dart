import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:getx_example/features1/models/product.dart';

class CartController extends GetxController {
  var cartItems = <Product>[].obs;
  var favItems = <Product>[].obs;
  double testAmount = 0.0;

  double get totalPrice => cartItems.fold(0, (sum, item) => sum + item.price);
  int get count => cartItems.length;
  addToCart(Product product) {
    cartItems.add(product);
    // testAmount = totalPrice;
    // update();
  }

  addFavorite(Product product) {
    favItems.add(product);
  }
}
