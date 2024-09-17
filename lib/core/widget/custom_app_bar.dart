import 'package:educationapp/core/util/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      iconTheme: const IconThemeData(),
      title: Image.asset(AppImageAssets.iamgeBackBottom),
      actions: [
        Image.asset(
          AppImageAssets.logo,
          width: 61.w,
          height: 48.h,
        )
      ],
    );
  }
}
