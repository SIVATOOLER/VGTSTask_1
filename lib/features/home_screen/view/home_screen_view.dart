import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:vgts_task1/config/app_layout.dart';
import 'package:vgts_task1/features/home_screen/model/home_screen_model.dart';
import 'package:vgts_task1/features/home_screen/repo/home_screen_call.dart';
import 'package:vgts_task1/features/home_screen/widget/all_product_items.dart';
import 'package:vgts_task1/features/home_screen/widget/cus_textfield.dart';
import 'package:vgts_task1/utils/error_text.dart';
import 'package:vgts_task1/utils/loading_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {





  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context){
        return HomeScreenController();
      },
      child: Consumer<HomeScreenController>(
        builder:
            (BuildContext context, HomeScreenController value, Widget? child) {
          return Scaffold(
            body: SafeArea(
              child: Padding(
                padding: AppLayout.screenPadding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppLayout.sizeH8,
                    Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(FluentIcons.cart_20_regular),
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
                            value.filterFun(val);
                          },
                        )),
                    AppLayout.sizeH20,
                    FutureBuilder(
                        future: value.getMethod(),
                        builder: (BuildContext context, snapShot) {
                          if (snapShot.hasData) {
                            value.dataList = snapShot.data!.products;
                            if (value.isFirst) value.dummyList = value.dataList;
                            return Expanded(
                              flex: 4,
                              child: GridView.builder(
                                  shrinkWrap: true,
                                  itemCount: value.dummyList.length,
                                  gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      mainAxisSpacing: 40,
                                      childAspectRatio: 2.7,

                                      crossAxisCount: 1),
                                  itemBuilder: (context, index) {
                                    return AllProductItems(
                                      data: value.dummyList[index],
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
            },),

    );



  }
}
