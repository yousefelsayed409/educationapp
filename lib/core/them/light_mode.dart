import 'package:educationapp/core/util/app_const.dart';
import 'package:flutter/material.dart';

ThemeData lightThem() => ThemeData(
      scaffoldBackgroundColor: Colors.white,
      inputDecorationTheme: const InputDecorationTheme(
        suffixIconColor: Colors.grey,
      ),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: AppConst.primeryColor,
      ),
    );
