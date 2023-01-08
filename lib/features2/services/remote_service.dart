import 'package:getx_example/features2/models/product_model.dart';
import 'package:http/http.dart' as http;

class RemoteService {
  static String baseUrl =
      'https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline';
  static var client = http.Client();

  static Future<List<ProductModel>?> fetchProducts() async {
    var response = await client.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      var jsonData = response.body;
      return productModelFromJson(jsonData);
    }
    return null;
  }
}
