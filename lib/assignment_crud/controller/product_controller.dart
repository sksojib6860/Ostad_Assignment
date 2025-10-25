import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/product.dart';
import '../utils/urls.dart';

class ProductController {
  static List<Data> products = [];

  static Future<void> getProducts() async {
    Uri uri = Uri.parse(Url.readURL);
    try {
      var response = await http.get(uri);
      if (response.statusCode == 200) {
        var jsonBody = jsonDecode(response.body);
        var product = Product.fromJson(jsonBody);
        products = product.data ?? [];
      }
    } catch (e) {
      print("Data load fail: $e");
    }
  }

  static Future<bool> createProduct(Data product) async {
    Uri url = Uri.parse(Url.createURL);
    try {
      var response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(product.toJson()),
      );
      print("Create response: ${response.body}");
      if (response.statusCode == 200) {
        await getProducts();
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print("Product create failed: $e");
      return false;
    }
  }

  static Future<bool> updateProduct(String id, Data product) async {
    Uri url = Uri.parse("${Url.updateURL}/$id");
    try {
      var response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(product.toJson()),
      );
      print("Update response: ${response.body}");
      if (response.statusCode == 200) {
        await getProducts();
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print("Product update failed: $e");
      return false;
    }
  }

  static Future<bool> deleteProduct(String id) async {
    Uri url = Uri.parse("${Url.deleteURL}/$id");
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        await getProducts();
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print("Product delete failed: $e");
      return false;
    }
  }
}
