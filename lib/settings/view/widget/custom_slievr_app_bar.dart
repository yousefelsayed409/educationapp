import 'package:educationapp/core/style/text_style.dart';
import 'package:educationapp/core/util/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      sliver: SliverAppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: Text(
            'Profile',
            style: Style.textStyle30,
          ),
          actions: [
            Image.asset(AppImageAssets.logo, width: 60.w, height: 50.h),
          ],
          leading: InkWell(
              onTap: () => Navigator.pop(context),
              child: Image.asset(AppImageAssets.iamgeBackBottom))),
    );
  }
}
