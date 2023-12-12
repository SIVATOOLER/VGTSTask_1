
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:vgts_task1/config/app_color.dart';
import 'package:vgts_task1/features/home_screen/view/home_screen_view.dart';
import 'package:vgts_task1/locale.dart';
import 'config/routes.dart';
import 'features/home_screen/view_model/home_screen_controller.dart';
import 'features/home_screen/view_model/search_controller.dart';
import 'features/product_screen/view_model/product_screen_call.dart';
import 'splash_screen/view/splash_screen_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
    supportedLocales: L10n.all,
    path: 'assets/lang',
    fallbackLocale:   L10n.all[0],
    startLocale:   L10n.all[0],
    saveLocale: true,
    child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => HomeScreenController()),
          ChangeNotifierProvider(create: (_) => ProductScreenController()),
          ChangeNotifierProvider(create: (_) => FilterController()),
        ],
        child: const MyApp()),
  ));
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      onGenerateRoute:onGenerateRoute ,
      title: 'Flutter Demo',
      theme: ThemeData(
          scaffoldBackgroundColor: AppColor.kColor.onInverseSurface,
          colorScheme: AppColor.kColor,
          useMaterial3: true,
          // appBarTheme: ThemeData().appBarTheme.copyWith(
          //       backgroundColor: AppColor.kColor.onInverseSurface,
          //     ),
          textButtonTheme: TextButtonThemeData(
              style: ButtonStyle(
            foregroundColor: MaterialStatePropertyAll(
                AppColor.kColor.onPrimaryContainer.withOpacity(0.6)),
          )),
          textTheme: ThemeData().textTheme.copyWith(
                titleMedium: GoogleFonts.rubik(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColor.blackText),
                bodyMedium: GoogleFonts.rubik(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: AppColor.blackText),
              ),
          iconButtonTheme: IconButtonThemeData(
              style: ButtonStyle(
            padding: const MaterialStatePropertyAll(EdgeInsets.all(5)),
            iconColor: MaterialStatePropertyAll(
                AppColor.kColor.onPrimaryContainer.withOpacity(0.6)),
            backgroundColor: const MaterialStatePropertyAll(Colors.white),
          ))),
      home: const SplashScreen(),
    );
  }
}
