import 'package:educationapp/auth/manager/cubit/authentication_cubit.dart';
import 'package:educationapp/core/data/api/api_const.dart';
import 'package:educationapp/core/data/local_data/get_data_of_user.dart';
import 'package:educationapp/core/data/local_data/shared_prefrance.dart';
import 'package:educationapp/core/extention/extention.dart';
import 'package:educationapp/core/router/app_router_name.dart';
import 'package:educationapp/core/style/app_color.dart';
import 'package:educationapp/core/style/text_style.dart';
import 'package:educationapp/core/util/app_const.dart';
import 'package:educationapp/core/widget/custom_bottom.dart';
import 'package:educationapp/core/widget/flutter_toaster.dart';
import 'package:educationapp/core/widget/show_loading.dart';
import 'package:educationapp/core/widget/text_form_field/email_form_field.dart';
import 'package:educationapp/core/widget/text_form_field/password_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FormToLogin extends StatelessWidget {
  const FormToLogin({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<AuthenticationCubit>(context);
    // var _box = Hive.box(AppConst.userBox);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      child: Form(
        key: cubit.formkey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 100.h),
            Text('Log in', style: Style.textStyle30),
            SizedBox(height: 20.h),
            EmailFormField(controller: cubit.email),
            12.hs,
            PasswordFormField(controller: cubit.password),
            12.hs,
            Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                    onTap: () => Navigator.pushNamed(
                        context, AppRouterName.forgetPassword),
                    child: Text('Forgot password?', style: Style.textStyle14))),
            12.hs,
            BlocConsumer<AuthenticationCubit, AuthenticationState>(
              listener: (context, state) async {
                if (state is AuthenticationIsFailuer) {
                  flutterToast(message: state.errorMessage);
                } else if (state is AuthenticationIsSuccess) {
                  await _statuesSuccess(
                      context,
                      //_box,
                      state);
                }
              },
              builder: (context, state) {
                if (state is AuthenticationIsLoading) {
                  return const ShowLoadingWidget();
                }
                return CustomBottom(
                    title: 'Log in',
                    height: 55.h,
                    width: double.infinity,
                    ontap: () {
                      if (cubit.formkey.currentState!.validate()) {
                        cubit.auth(endpoint: ApiConsr.login, data: {
                          'email': cubit.email.text,
                          'password': cubit.password.text
                        });
                      }
                    },
                    color: AppColor.black);
              },
            ),
            const Spacer(flex: 1),
            //  Center(child: textInfo(context)),
            SizedBox(height: 30.h)
          ],
        ),
      ),
    );
  }

  Future<void> _statuesSuccess(
      BuildContext context, AuthenticationIsSuccess state) async {
    try {
      await MySharedPrefrence.setData(
          key: AppConst.token, value: state.userModel!.token);
      flutterToast(message: 'You have been logged in successfully');
      GetUserFromLockel.add(usermodel: state.userModel!);
      GetUserFromLockel.init();
      Navigator.of(context)
          .pushNamedAndRemoveUntil(AppRouterName.homepage, (route) => false);
    } on Exception catch (e) {
      flutterToast(message: e.toString());
    }
  }
}
