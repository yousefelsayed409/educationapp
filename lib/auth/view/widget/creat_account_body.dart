import 'package:educationapp/auth/view/widget/form_creat_account.dart';
import 'package:educationapp/core/style/app_color.dart';
import 'package:educationapp/core/util/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateAccountBody extends StatelessWidget {
  const CreateAccountBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Image.asset(
              AppImageAssets.background,
            ),
            Expanded(
                child: Container(
              width: MediaQuery.of(context).size.width * 1,
              color: AppColor.white,
            ))
          ],
        ),
        Positioned(
            right: 0,
            left: 0,
            bottom: 0,
            top: 145.h,
            child: const FormCreatAccount())
      ],
    );
  }
}
