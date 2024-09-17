// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:freelace/core/style/app_color.dart';
// import 'package:freelace/core/style/text_style.dart';
// import 'package:freelace/core/widget/custom_bottom.dart';
// import 'package:freelace/core/widget/text_form_field/custom_text_form_field.dart';
// import 'package:flutter/gestures.dart';

// class FormToSinUp extends StatefulWidget {
//   const FormToSinUp({super.key});

//   @override
//   State<FormToSinUp> createState() => _FormToSinUpState();
// }

// class _FormToSinUpState extends State<FormToSinUp> {
 
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 30.w),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           SizedBox(height: 100.h),
//           Text('Sign up', style: Style.textStyle30),
//           SizedBox(height: 20.h),
//           CustomTextFormFiled(
//             hint: 'Email',
//             onChanged: (String? value) {},
//             validate: (String? value) {
//               return null;
//             },
//             isPassword: false,
//             controller: TextEditingController(),
//           ),
//           SizedBox(height: 12.h),
//           CustomTextFormFiled(
//             hint: 'Password',
//             onChanged: (String? value) {},
//             validate: (String? value) {
//               return null;
//             },
//             isPassword: true,
//             controller: TextEditingController(),
//           ),
//           SizedBox(height: 12.h),
//           CustomTextFormFiled(
//             hint: 'Confirm Password',
//             onChanged: (String? value) {},
//             validate: (String? value) {
//               return null;
//             },
//             isPassword: true,
//             controller: TextEditingController(),
//           ),
//           SizedBox(height: 12.h),
//           CustomBottom(
//               title: 'Sign Up',
//               height: 55.h,
//               width: double.infinity,
//               ontap: () {},
//               color: AppColor.black),
//           const Spacer(flex: 1),
//           Center(child: textInfo(context)),
//           SizedBox(height: 20.h)
//         ],
//       ),
//     );
//   }

//   Widget textInfo(BuildContext context) {
//     return RichText(
//       text: TextSpan(
//         children: [
//           TextSpan(
//             text: "Already have an account? ",
//             style: Style.textStyle14,
//           ),
//           TextSpan(
//           text: "Log in",
//           style: Style.textStyle14.copyWith(color: AppColor.kPeimeryColor),
//           recognizer: TapGestureRecognizer()
//             ..onTap = () {
//               Navigator.pop(context);
//             },
//         ),
//         ],
//       ),
//     );
//   }
// }
