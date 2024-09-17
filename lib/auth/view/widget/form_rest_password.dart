import 'package:educationapp/auth/manager/cubit/authentication_cubit.dart';
import 'package:educationapp/auth/view/reser_password.dart';
import 'package:educationapp/core/data/api/api_server.dart';
import 'package:educationapp/core/extention/extention.dart';
import 'package:educationapp/core/router/app_router_name.dart';
import 'package:educationapp/core/style/app_color.dart';
import 'package:educationapp/core/style/text_style.dart';
import 'package:educationapp/core/widget/custom_bottom.dart';
import 'package:educationapp/core/widget/flutter_toaster.dart';
import 'package:educationapp/core/widget/show_loading.dart';
import 'package:educationapp/core/widget/text_form_field/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FormResetPassword extends StatelessWidget {
  const FormResetPassword({super.key, required this.restPasswordModel});
  final RestPasswordModel restPasswordModel;
  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<AuthenticationCubit>(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      child: Form(
        key: cubit.formkey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 80.h),
            Text('Reset password', style: Style.textStyle36),
            Text('Please type something you’ll remember',
                style: Style.textStyle16),
            80.hs,
            CustomTextFormFiled(
              hint: 'Password',
              onChanged: (String? value) {
                cubit.password.text = value!;
              },
              validate: (String? value) {
                if (value!.isEmpty) {
                  return 'Enter Password';
                } else if (value != cubit.confirmPassword.text) {
                  return 'The two passwords must match';
                } else {
                  return null;
                }
              },
              isPassword: true,
              controller: cubit.password,
            ),
            CustomTextFormFiled(
              hint: 'repeat password',
              onChanged: (String? value) {
                cubit.confirmPassword.text = value!;
                print(cubit.confirmPassword.text);
              },
              validate: (String? value) {
                if (value!.isEmpty) {
                  return 'Enter Password';
                } else if (value != cubit.password.text) {
                  return 'The two passwords must match';
                } else {
                  return null;
                }
              },
              isPassword: true,
              controller: cubit.confirmPassword,
            ),
            const Spacer(flex: 1),
            BlocConsumer<AuthenticationCubit, AuthenticationState>(
              listener: (context, state) {
                if (state is AuthenticationIsFailuer) {
                  flutterToast(message: state.errorMessage);
                } else if (state is AuthenticationIsSuccess) {
                  flutterToast(message: 'Password successfully changed');
                  Navigator.of(context)
                      .pushReplacementNamed(AppRouterName.passwordChanged);
                }
              },
              builder: (context, state) {
                if (state is AuthenticationIsLoading) {
                  return const ShowLoadingWidget();
                }
                return CustomBottom(
                    title: 'Confirm',
                    height: 55.h,
                    width: double.infinity,
                    ontap: () async {
                      var response = await ApiService.post(
                          endpoint:
                              'https://graduation-project.odeh-design.com/api/reset-password',
                          data: {
                            'email': restPasswordModel.email,
                            'code': restPasswordModel.code,
                            'password': '123456789',
                            'confirm password': '123456789',
                          });

                      print(response.data);
                      if (cubit.formkey.currentState!.validate()) {}
                    },
                    color: AppColor.black);
              },
            ),
            SizedBox(height: 30.h)
          ],
        ),
      ),
    );
  }
}
