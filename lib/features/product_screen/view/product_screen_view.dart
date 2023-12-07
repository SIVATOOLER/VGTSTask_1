import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vgts_task1/config/app_layout.dart';
import 'package:vgts_task1/features/product_screen/repo/product_screen_call.dart';
import 'package:vgts_task1/utils/error_text.dart';
import 'package:vgts_task1/utils/loading_widget.dart';
import 'package:vgts_task1/widget/cus_indicator.dart';
import 'package:vgts_task1/widget/rating_widget.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';


class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key, required this.id});
  final String id;

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  var currentIndex=0;
  @override
  Widget build(BuildContext context) {
    final sHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              FutureBuilder(
                  future: ProductScreenCall().getMethod(widget.id),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          AppLayout.sizeH30,
                          Padding(
                            padding: AppLayout.cardPadding,
                            child: CarouselSlider.builder(
                              itemCount: snapshot.data!.images.length,
                              itemBuilder: (BuildContext context, int itemIndex,
                                      int pageViewIndex) =>
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white70,
                                        borderRadius: BorderRadius.circular(12),
                                        image: DecorationImage(image: NetworkImage(snapshot.data!.images[itemIndex],
                                        ),fit: BoxFit.contain
                                          ,)
                                    ),

                                  ),
                              options: CarouselOptions(

                                height: sHeight * 0.4,
                                autoPlay: false,
                                enlargeCenterPage: true,
                                viewportFraction: 0.9,
                                initialPage: 0,
                                onPageChanged: (index,reason){
                                  setState(() {

                                    currentIndex=index;
                                  });
                                }
                              ),
                            ),
                          ),AppLayout.sizeH20,
                          Center(child: CusIndicator(index:currentIndex , length: snapshot.data!.images.length)),
                          AppLayout.sizeH8,
                          Padding(
                            padding: AppLayout.cardPadding,
                            child: Text(
                              snapshot.data!.title,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ), AppLayout.sizeH5,
                          Padding(
                            padding: AppLayout.cardPadding,
                            child: Row(
                              children: [
                                Text(
                                  "Review :",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(fontWeight: FontWeight.w500),
                                ),
                                RatingWidget(
                                    rating: snapshot.data!.rating.toInt())
                              ],
                            ),
                          ),
                          AppLayout.sizeH20,
                          Padding(
                            padding: AppLayout.cardPadding,
                            child: Text(
                              snapshot.data!.description,

                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                height: 1.5
                              ),
                            ),
                          ),
                          AppLayout.sizeH20,
                          Container(
                            height: sHeight * 0.06,
                            color: Colors.white,
                            child: Center(
                                child: Text(
                              "Discount Percentage : ${snapshot.data!.discountPercentage} %",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      color: Theme.of(context)
                                          .primaryColor
                                          .withOpacity(0.6)),
                            )),
                          ),
                          AppLayout.sizeH20,
                          Padding(
                            padding: AppLayout.cardPadding,
                            child: Container(
                              height: sHeight * 0.06,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12)),
                              child: Center(
                                  child: Text(
                                "Brand :${snapshot.data!.brand} (${snapshot.data!.category})",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(),
                              )),
                            ),
                          ),
                          AppLayout.sizeH30,AppLayout.sizeH10,
                          Padding(
                            padding: AppLayout.cardPadding,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Theme.of(context)
                                      .primaryColor
                                      .withOpacity(0.6),
                                  borderRadius: BorderRadius.circular(12)),
                              height: sHeight * 0.09,
                              child: Padding(
                                padding: AppLayout.cardPadding,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    RichText(
                                        text: TextSpan(children: [
                                      TextSpan(
                                        text: "Total Amount\n",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall!
                                            .copyWith(color: Colors.white),
                                      ),
                                      TextSpan(
                                        text: "\$${snapshot.data!.price}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall!
                                            .copyWith(
                                                color: Colors.white,
                                                fontSize: 25),
                                      )
                                    ])),
                                    Container(
                                      height: sHeight * 0.045,
                                      decoration: BoxDecoration(
                                          color: Theme.of(context)
                                              .primaryColor
                                              .withOpacity(0.9),
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      child: Center(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10, right: 10),
                                          child: Text(
                                            "Add to Cart",
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall!
                                                .copyWith(
                                                  color: Colors.white,
                                                ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          AppLayout.sizeH20,
                        ],
                      );
                    } else if (snapshot.hasError) {
                      return const Padding(
                        padding: EdgeInsets.only(top: 100),
                        child: ErrorText(),
                      );
                    } else {
                      return const Padding(
                        padding: EdgeInsets.only(top: 100),
                        child: LoadingWidget(),
                      );
                    }
                  }),
              Padding(
                padding: AppLayout.cardPadding,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                   IconButton(
                       onPressed: (){
                         Navigator.pop(context);
                       }, icon: Icon(CupertinoIcons.arrow_left,
                   color: Colors.black.withOpacity(0.5),)),

                    Column(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(FluentIcons.cart_20_regular),
                        ),
                        AppLayout.sizeH5,
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(FluentIcons.heart_20_regular),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
