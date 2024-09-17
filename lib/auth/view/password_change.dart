import 'package:educationapp/core/router/app_router_name.dart';
import 'package:educationapp/core/style/app_color.dart';
import 'package:educationapp/core/style/text_style.dart';
import 'package:educationapp/core/util/app_image.dart';
import 'package:educationapp/core/widget/custom_bottom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PasswordChangeScreen extends StatelessWidget {
  const PasswordChangeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 33.w),
          child: Column(
            children: [
              SizedBox(height: 30.h),
              Image.asset(AppImageAssets.logo),
              Text('Password Changed', style: Style.textStyle36),
              Text('Your Password has been changed', style: Style.textStyle14),
              Text('Succesfully', style: Style.textStyle14),
              SizedBox(height: 50.h),
              CustomBottom(
                  title: 'Back to login',
                  height: 55.h,
                  width: double.infinity,
                  ontap: () {
                    Navigator.pushReplacementNamed(
                        context, AppRouterName.loginScreen);
                  },
                  color: AppColor.black),
              const Spacer(flex: 1),
              Image.asset(AppImageAssets.backHome),
              SizedBox(
                height: 30.h,
              )
            ],
          ),
        ),
      ),
    );
  }
}
