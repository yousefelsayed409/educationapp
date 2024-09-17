import 'package:educationapp/core/data/local_data/shared_prefrance.dart';
import 'package:educationapp/core/router/app_router_name.dart';
import 'package:educationapp/core/style/app_color.dart';
import 'package:educationapp/core/style/text_style.dart';
import 'package:educationapp/core/util/app_const.dart';
import 'package:educationapp/core/util/app_image.dart';
import 'package:educationapp/core/widget/custom_bottom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            AppImageAssets.onboarding,
            fit: BoxFit.fitWidth,
            width: MediaQuery.of(context).size.width * 1,
          ),
          const ShowDailog()
        ],
      )),
    );
  }
}

class ShowDailog extends StatelessWidget {
  const ShowDailog({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 22.w),
      width: 360.w,
      height: 530.h,
      decoration: BoxDecoration(
          color: const Color(0XFF766C4C),
          borderRadius: BorderRadius.circular(22)),
      child: Column(
        children: [
          Image.asset(
            AppImageAssets.logo,
            width: 370.w,
            height: 250.h,
          ),
          Text(
            'بوابة الشهاده للخريجين',
            style: Style.textStyle20,
          ),
          Text(
            'جامعة المنصورة',
            textAlign: TextAlign.center,
            style: Style.textStyle20,
          ),
          SizedBox(height: 40.h),
          CustomBottom(
              title: 'Get Start',
              height: 55.h,
              width: double.infinity,
              ontap: () async {
                await MySharedPrefrence.setData(
                    key: AppConst.onBoarding, value: AppConst.onBoarding);
                Navigator.of(context).pushNamedAndRemoveUntil(
                    AppRouterName.creatAccount, (route) => false);
              },
              color: AppColor.black),
        ],
      ),
    );
  }
}
