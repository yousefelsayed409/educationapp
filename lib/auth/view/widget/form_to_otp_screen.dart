import 'package:educationapp/auth/view/widget/pein_code_form.dart';
import 'package:educationapp/core/style/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FormToOtbScreen extends StatelessWidget {
  const FormToOtbScreen({super.key, required this.email});
  final String email;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50.h),
            Text('Please check your email', style: Style.textStyle36),
            Text('We’ve sent a code to helloworld@gmail.com',
                style: Style.textStyle16),
            SizedBox(height: 15.h),
            PinCodeFieldsForm(email: email),
          ],
        ),
      ),
    );
  }
}
