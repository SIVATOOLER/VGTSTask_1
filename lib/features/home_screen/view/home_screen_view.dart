import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:vgts_task1/config/app_layout.dart';
import 'package:vgts_task1/features/home_screen/widget/all_product_items.dart';
import 'package:vgts_task1/features/home_screen/widget/cus_textfield.dart';
import 'package:vgts_task1/utils/error_text.dart';
import 'package:vgts_task1/utils/loading_widget.dart';
import '../../../locale/locale_keys.g.dart';
import '../view_model/home_screen_controller.dart';
import '../view_model/search_controller.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final homeProvider =context.watch<HomeScreenController>();
    final searchProvider =context.watch<FilterController>();
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
                    Text(LocaleKeys.mobile_phone.tr(),
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    AppLayout.sizeH20,
                    Expanded(
                        flex: 0,
                        child: CusTextfield(
                          onChangeFun: (val) {
                            searchProvider.filterFun(val);
                          },
                        )),
                    AppLayout.sizeH20,
                    FutureBuilder(
                        future: homeProvider.getMethod(),
                        builder: (BuildContext context, snapShot) {
                          if (snapShot.hasData) {
                            searchProvider.dataList = snapShot.data!.products;
                            if (searchProvider.isFirst) {
                              searchProvider.dummyList = searchProvider.dataList;
                            }
                            return Expanded(
                              flex: 4,
                              child: GridView.builder(
                                  shrinkWrap: true,
                                  itemCount: searchProvider.dummyList.length,
                                  gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      mainAxisSpacing: 40,
                                      childAspectRatio: 2.7,
                                      crossAxisCount: 1),
                                  itemBuilder: (context, index) {
                                    return AllProductItems(
                                      data: searchProvider.dummyList[index],
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
