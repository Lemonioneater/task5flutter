import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:task3ahmed_faisal/Data/Product%20file.dart';
List<Product> bought = [];

class DataSource {
  static Future<List<Product>> getData() async {
    final response =
    await http.get(Uri.parse('https://dummyjson.com/products'));
    List<Product> productsList = [];

    if (response.statusCode == 200) {
      var jsonResponse =
      convert.jsonDecode(response.body) as Map<String, dynamic>;
      for (var item in jsonResponse['products']) {
        productsList.add(Product.fromJson(item));
      }
    }
    return productsList;
  }

  static List<Product> products = [];
  static bool isLoading = true;
}
