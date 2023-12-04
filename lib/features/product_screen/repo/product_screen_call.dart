import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:vgts_task1/features/home_screen/model/home_screen_model.dart';
import 'package:vgts_task1/features/product_screen/model/product_screen_model.dart';

class ProductScreenCall {
  final String baseUrl = "https://dummyjson.com/products";

  Future<ProductModel> getMethod(id) async {
    final response = await http.get(Uri.parse("$baseUrl/$id"));

    if (response.statusCode == 200) {
      final data = ProductModel.fromJson(json.decode(response.body));

      log("$data");
      return data;
    } else {
      throw Exception('Failed to Connect.');
    }
  }
}
