import 'package:flutter/material.dart';
import 'package:vgts_task1/config/app_color.dart';
import 'package:vgts_task1/config/app_layout.dart';
import 'package:vgts_task1/config/app_routes.dart';
import 'package:vgts_task1/config/routes.dart';
import 'package:vgts_task1/features/home_screen/model/home_screen_model.dart';
import 'package:vgts_task1/widget/rating_widget.dart';

class AllProductItems extends StatelessWidget {
  const AllProductItems({super.key, required this.data});
  final Product data;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
       Navigator.pushNamed(context, AppRoutes.product,arguments: ProductScreenArguments(id: "${data.id}"));
      },
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondaryContainer,
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(image: NetworkImage(data.thumbnail,
                  ),fit: BoxFit.fill,)
              ),
            ),
          ),
          AppLayout.sizeW20,
          Expanded(
            flex: 5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.title,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                AppLayout.sizeH5,
                RatingWidget(
                  rating: data.rating.toInt(),
                ),
                AppLayout.sizeH20,
                Text(
                  "\$${data.price}",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontSize: 18,
                      color: AppColor.buttonColorText.withOpacity(0.6)),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
