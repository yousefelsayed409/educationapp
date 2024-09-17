import 'dart:async';
import 'package:educationapp/core/router/app_router_name.dart';
import 'package:educationapp/core/util/app_image.dart';
import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 1),
      () {
        Navigator.of(context).pushNamed(AppRouterName.secondSplashView);
      },
    );

    return SafeArea(
      child: Scaffold(
          backgroundColor: const Color(0xffF4D471),
          body: Image.asset(
            AppImageAssets.imageSlashView,
            width: MediaQuery.of(context).size.width * 1,
          )),
    );
  }
}
