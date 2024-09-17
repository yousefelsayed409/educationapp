import 'package:educationapp/core/style/app_color.dart';
import 'package:flutter/material.dart';

class ShowLoadingWidget extends StatelessWidget {
  const ShowLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: AppColor.black,
      ),
    );
  }
}
