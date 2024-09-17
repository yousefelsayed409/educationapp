import 'package:educationapp/core/data/local_data/shared_prefrance.dart';
import 'package:educationapp/core/router/app_router_name.dart';
import 'package:educationapp/core/util/app_const.dart';
import 'package:educationapp/core/util/app_image.dart';
import 'package:flutter/material.dart';

class SecondSplashView extends StatelessWidget {
  const SecondSplashView({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 1),
      () {
        if (MySharedPrefrence.get(AppConst.onBoarding) == null) {
          Navigator.of(context).pushNamedAndRemoveUntil(
              AppRouterName.onboarding, (route) => false);
        } else if (MySharedPrefrence.get(AppConst.token) != null) {
          Navigator.of(context).pushNamedAndRemoveUntil(
              AppRouterName.homepage, (route) => false);
        } else if (MySharedPrefrence.get(AppConst.creatAccount) == null) {
          Navigator.of(context).pushNamedAndRemoveUntil(
              AppRouterName.creatAccount, (route) => false);
        } else if (MySharedPrefrence.get(AppConst.creatAccount) != null) {
          Navigator.of(context).pushNamedAndRemoveUntil(
              AppRouterName.loginScreen, (route) => false);
        }
      },
    );
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              child: Image.asset(
                AppImageAssets.logo,
              ),
            )
          ],
        ),
      ),
    );
  }
}
