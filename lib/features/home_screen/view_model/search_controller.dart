import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../model/home_screen_model.dart';

class FilterController with ChangeNotifier{
  List<Product> dummyList = [];
  List<Product> dataList = [];
  bool isFirst = true;

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
  }
