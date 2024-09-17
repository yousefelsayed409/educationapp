import 'package:educationapp/core/style/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class Style {
  static TextStyle textStyle30 = TextStyle(
      fontSize: 30.sp,
      fontWeight: FontWeight.w700,
      color: AppColor.kPeimeryColor);
  static TextStyle textStyle36 = TextStyle(
      fontSize: 36.sp,
      fontWeight: FontWeight.w700,
      color: AppColor.kPeimeryColor);
  static TextStyle textStyle14 = TextStyle(
      fontSize: 14.sp, fontWeight: FontWeight.w400, color: AppColor.black);
  static TextStyle textStyle14weight700 = TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w700,
      color: AppColor.kPeimeryColor);
  static TextStyle textStyle20 = TextStyle(
      fontSize: 20.sp, fontWeight: FontWeight.w700, color: AppColor.white);
  static TextStyle textStyle24 = TextStyle(
      fontSize: 24.sp, fontWeight: FontWeight.w700, color: AppColor.black);
  static TextStyle textStyle16 = TextStyle(
      fontSize: 16.sp, fontWeight: FontWeight.w400, color: AppColor.black);
}
