import 'dart:async';

import 'package:flutter/material.dart';
import 'package:vgts_task1/config/app_routes.dart';

import '../../features/home_screen/view/home_screen_view.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  nextScreen(){
    Timer(const Duration(seconds: 2),
            ()=>Navigator.popAndPushNamed(context, AppRoutes.home)
    );
  }

  @override
  void initState() {
   nextScreen();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
