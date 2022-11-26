import 'package:getx_practice/model/product_model.dart';
import 'package:http/http.dart' as http;

class RemoteServices {
  static var httpClient = http.Client();

  static Future<List<ProductModel>> getProducts() async {
    final response = await httpClient.get(
      Uri.parse(
        'https://fakestoreapi.com/products',
      ),
    );
    if (response.statusCode == 200) {
      var data = response.body;
      return productModelFromJson(data);
    } else {
      return [];
    }
  }
}
