import 'package:flutter/material.dart';
import 'package:vgts_task1/config/app_routes.dart';
import 'package:vgts_task1/features/home_screen/view/home_screen_view.dart';
import 'package:vgts_task1/features/product_screen/view/product_screen_view.dart';


Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
  final arg = routeSettings.arguments;
  switch(routeSettings.name){
    case AppRoutes.home:
      return MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      );
      case AppRoutes.product:
      return MaterialPageRoute(
        builder: (context) =>  ProductScreen(id: arg as ProductScreenArguments ),
      );
    default:
      return MaterialPageRoute(
        builder: (context) => const ErrorPage(),
      );
  }
}
class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('No Page Found'),
      ),
    );
  }
}

class ProductScreenArguments{
  final String id;
  ProductScreenArguments({required this.id});
}