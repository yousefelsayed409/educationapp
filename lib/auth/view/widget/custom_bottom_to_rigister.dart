import 'package:educationapp/auth/manager/cubit/authentication_cubit.dart';
import 'package:educationapp/core/data/api/api_const.dart';
import 'package:educationapp/core/data/local_data/shared_prefrance.dart';
import 'package:educationapp/core/router/app_router_name.dart';
import 'package:educationapp/core/style/app_color.dart';
import 'package:educationapp/core/util/app_const.dart';
import 'package:educationapp/core/widget/custom_bottom.dart';
import 'package:educationapp/core/widget/flutter_toaster.dart';
import 'package:educationapp/core/widget/show_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBottomToRigister extends StatelessWidget {
  const CustomBottomToRigister({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<AuthenticationCubit>(context);

    return BlocConsumer<AuthenticationCubit, AuthenticationState>(
      listener: (context, state) {
        if (state is AuthenticationIsFailuer) {
          flutterToast(message: state.errorMessage);
        } else if (state is AuthenticationIsSuccess) {
          cubit.dispos();

          flutterToast(message: 'Account successfully created');
          Navigator.of(context).pushNamedAndRemoveUntil(
              AppRouterName.loginScreen, (route) => false);
          MySharedPrefrence.setData(
              key: AppConst.creatAccount, value: AppConst.creatAccount);
        }
      },
      builder: (context, state) {
        if (state is AuthenticationIsLoading) {
          return const ShowLoadingWidget();
        }
        return CustomBottom(
          title: 'Next',
          height: 55.h,
          width: double.infinity,
          ontap: () async {
            if (cubit.formkey.currentState!.validate()) {
              await cubit.auth(endpoint: ApiConsr.rigigster, data: {
                'username': cubit.userName.text,
                'email': cubit.email.text,
                'national_id': cubit.nationalId.text,
                'password': cubit.password.text,
              });
            }
          },
          color: AppColor.black,
        );
      },
    );
  }
}
