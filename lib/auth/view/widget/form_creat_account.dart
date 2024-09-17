import 'package:educationapp/auth/manager/cubit/authentication_cubit.dart';
import 'package:educationapp/auth/view/widget/custom_bottom_to_rigister.dart';
import 'package:educationapp/core/extention/extention.dart';
import 'package:educationapp/core/router/app_router_name.dart';
import 'package:educationapp/core/style/app_color.dart';
import 'package:educationapp/core/style/text_style.dart';
import 'package:educationapp/core/widget/text_form_field/email_form_field.dart';
import 'package:educationapp/core/widget/text_form_field/nation_id_form.dart';
import 'package:educationapp/core/widget/text_form_field/password_form.dart';
import 'package:educationapp/core/widget/text_form_field/user_name_formd_fiekd.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FormCreatAccount extends StatelessWidget {
  const FormCreatAccount({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<AuthenticationCubit>(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 22.w),
      child: Form(
        key: cubit.formkey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text('Create account', style: Style.textStyle30),
              50.hs,
              UserNameField(controller: cubit.userName),
              NationalIdForm(controller: cubit.nationalId),
              EmailFormField(controller: cubit.email),
              PasswordFormField(controller: cubit.password),
              24.hs,
              SizedBox(height: 24.h),
              const CustomBottomToRigister(),
              12.hs,
              InkWell(
                onTap: () => Navigator.of(context).pushNamedAndRemoveUntil(
                    AppRouterName.loginScreen, (route) => false),
                child: const Text(
                  'I have account ?',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.w400,
                    color: AppColor.black,
                    fontSize: 17,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
