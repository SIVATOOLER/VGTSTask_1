import 'dart:convert';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:vgts_task1/features/home_screen/model/home_screen_model.dart';
import '../../../utils/state_enum.dart';



class HomeScreenController with ChangeNotifier{
  HomeScreenController(){
    changeState(StateEnum.success);
  }
  //BuildContext context;
  late StateEnum state;
  List<Product> dummyList = [];
  List<Product> dataList = [];
  bool isFirst = true;
  final baseUrl = "https://dummyjson.com/products";



  changeState(StateEnum stateEnum) {
    state = stateEnum;
    notifyListeners();
  }

  filterFun(String value) {
    isFirst = false;

      if (value.isEmpty) {
        dummyList = dataList;
        notifyListeners();
        // log("${dummyList.length}");
      } else {
        dummyList = dataList
            .where((element) =>
            element.title.toLowerCase().contains(value.toLowerCase()))
            .toList();
        print("${dummyList.length}");
        notifyListeners();
      }

  }


  Future<AllProductModel> getMethod() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final data = AllProductModel.fromJson(json.decode(response.body));
     // changeState(StateEnum.success);
      log("${data.products}");
      return data;
    } else {
      throw Exception('Failed to Connect.');
    }
  }
}




