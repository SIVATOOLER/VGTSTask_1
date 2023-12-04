import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:vgts_task1/features/home_screen/model/home_screen_model.dart';

class HomeScreenCall {
  final baseUrl = "https://dummyjson.com/products";

  Future<AllProductModel> getMethod() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final data = AllProductModel.fromJson(json.decode(response.body));

      log("${data.products}");
      return data;
    } else {
      throw Exception('Failed to Connect.');
    }
  }
}
