import 'package:get/state_manager.dart';
import 'package:getx_example/features2/models/product_model.dart';
import 'package:getx_example/features2/services/remote_service.dart';

class ProductController extends GetxController {
  var productList = <ProductModel>[].obs;
  var isLoading = true.obs;
  var isGridView = false.obs;
  var basketList = <ProductModel>[].obs;

  int get basketCount => basketList.length;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void addToBasket(ProductModel product) {
    basketList.add(product);
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      var responseProducts = await RemoteService.fetchProducts();
      if (responseProducts != null) {
        productList.value = responseProducts;
      }
    } finally {
      isLoading(false);
    }
  }
}
