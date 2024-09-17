import 'package:educationapp/auth/manager/cubit/authentication_cubit.dart';
import 'package:educationapp/core/extention/extention.dart';
import 'package:educationapp/core/router/app_router_name.dart';
import 'package:educationapp/core/style/app_color.dart';
import 'package:educationapp/core/style/text_style.dart';
import 'package:educationapp/core/widget/custom_bottom.dart';
import 'package:educationapp/core/widget/flutter_toaster.dart';
import 'package:educationapp/core/widget/show_loading.dart';
import 'package:educationapp/core/widget/text_form_field/email_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FormToForgetPassword extends StatelessWidget {
  const FormToForgetPassword({super.key});

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
            SizedBox(height: 100.h),
            Text('Forgot password?', style: Style.textStyle36),
            Text(
                'Don’t worry! It happens. Please enter the emailassociated with your account.',
                style: Style.textStyle16),
            30.hs,
            EmailFormField(controller: cubit.email),
            24.hs,
            BlocConsumer<AuthenticationCubit, AuthenticationState>(
              listener: (context, state) {
                if (state is AuthenticationIsFailuer) {
                  flutterToast(message: state.errorMessage);
                } else if (state is AuthenticationIsSuccess) {
                  Navigator.of(context).pushNamed(
                    AppRouterName.otpScreen,
                    arguments: cubit.email.text,
                  );
                }
              },
              builder: (context, state) {
                if (state is AuthenticationIsLoading) {
                  return const ShowLoadingWidget();
                }
                return CustomBottom(
                    title: 'Send code',
                    height: 55.h,
                    width: double.infinity,
                    ontap: () async {
                      if (cubit.formkey.currentState!.validate()) {
                        await cubit.forgetPassword(email: cubit.email.text);
                      }
                    },
                    color: AppColor.black);
              },
            ),
            const Spacer(flex: 1),
          ],
        ),
      ),
    );
  }
}
