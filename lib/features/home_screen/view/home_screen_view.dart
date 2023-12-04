import 'dart:developer';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vgts_task1/config/app_color.dart';
import 'package:vgts_task1/config/app_layout.dart';
import 'package:vgts_task1/features/home_screen/model/home_screen_model.dart';
import 'package:vgts_task1/features/home_screen/repo/home_screen_call.dart';
import 'package:vgts_task1/features/home_screen/widget/all_product_items.dart';
import 'package:vgts_task1/features/home_screen/widget/cus_textfield.dart';
import 'package:vgts_task1/features/product_screen/view/product_screen_view.dart';
import 'package:vgts_task1/utils/error_text.dart';
import 'package:vgts_task1/utils/loading_widget.dart';
import 'package:vgts_task1/widget/rating_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Product> dummyList = [];
  List<Product> dataList = [];
  bool _isFirst = true;
  filterFun(String value) {
    _isFirst = false;
    setState(() {
      if (value.isEmpty) {
        dummyList = dataList;
        // log("${dummyList.length}");
      } else {
        dummyList = dataList
            .where((element) =>
                element.title.toLowerCase().contains(value.toLowerCase()))
            .toList();
        print("${dummyList.length}");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: AppLayout.screenPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.shopping_cart_outlined),
                ),
              ),
              Text(
                "Mobile Phone",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              AppLayout.sizeH20,
              Expanded(
                  flex: 0,
                  child: CusTextfield(
                    onChangeFun: (val) {
                      filterFun(val);
                    },
                  )),
              AppLayout.sizeH20,
              FutureBuilder(
                  future: HomeScreenCall().getMethod(),
                  builder: (BuildContext context, snapShot) {
                    if (snapShot.hasData) {
                      dataList = snapShot.data!.products;
                      if (_isFirst) dummyList = dataList;
                      return Expanded(
                        flex: 4,
                        child: GridView.builder(
                            shrinkWrap: true,
                            itemCount: dummyList.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    mainAxisSpacing: 20,
                                    childAspectRatio: 3 / 1,
                                    crossAxisCount: 1),
                            itemBuilder: (context, index) {
                              return AllProductItems(
                                data: dummyList[index],
                              );
                            }),
                      );
                    } else if (snapShot.hasError) {
                      return const ErrorText();
                    } else {
                      return const LoadingWidget();
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }
}
