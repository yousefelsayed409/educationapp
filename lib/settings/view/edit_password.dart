import 'package:educationapp/core/extention/extention.dart';
import 'package:educationapp/core/style/app_color.dart';
import 'package:educationapp/core/widget/custom_bottom.dart';
import 'package:educationapp/core/widget/flutter_toaster.dart';
import 'package:educationapp/core/widget/show_loading.dart';
import 'package:educationapp/core/widget/text_form_field/custom_text_form_field.dart';
import 'package:educationapp/settings/manager/cubit/change_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditPassword extends StatelessWidget {
  const EditPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChangePasswordCubit(),
      child: const Scaffold(
        body: CustomScrollView(
          slivers: [EditPasswordBody()],
        ),
      ),
    );
  }
}

class EditPasswordBody extends StatefulWidget {
  const EditPasswordBody({super.key});

  @override
  State<EditPasswordBody> createState() => _EditPasswordBodyState();
}

class _EditPasswordBodyState extends State<EditPasswordBody> {
  late final TextEditingController currentPassword;
  late final TextEditingController newPassword;
  late final TextEditingController confirmPassword;
  late final GlobalKey<FormState> formKey;
  @override
  void initState() {
    currentPassword = TextEditingController();
    newPassword = TextEditingController();
    confirmPassword = TextEditingController();
    formKey = GlobalKey();

    super.initState();
  }

  @override
  void dispose() {
    currentPassword.dispose();
    newPassword.dispose();
    confirmPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<ChangePasswordCubit>(context);
    return SliverFillRemaining(
      hasScrollBody: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              150.hs,
              CustomTextFormFiled(
                  hint: 'Old password',
                  onChanged: (String value) {
                    currentPassword.text = value;
                  },
                  validate: (String? value) {
                    if (value!.isEmpty) {
                      return 'Enter Password';
                    } else {
                      return null;
                    }
                  },
                  isPassword: true,
                  controller: currentPassword),
              CustomTextFormFiled(
                hint: 'New password',
                onChanged: (String value) {},
                validate: (String? value) {
                  return _validator(value, cubit);
                },
                isPassword: true,
                controller: newPassword,
              ),
              CustomTextFormFiled(
                hint: 'Confirm new password',
                onChanged: (String value) {},
                validate: (String? value) {
                  return _validator(value, cubit);
                },
                isPassword: true,
                controller: confirmPassword,
              ),
              const Spacer(flex: 1),
              BlocConsumer<ChangePasswordCubit, ChangePasswordState>(
                listener: (context, state) {
                  if (state is ChangePasswordIsFailuer) {
                    flutterToast(message: state.errorMessage);
                  } else if (state is ChangePasswordIsSucees) {
                    flutterToast(message: 'Changed Password is Success');
                    Navigator.pop(context);
                  }
                },
                builder: (context, state) {
                  if (state is ChangePasswordIsLoading) {
                    return const ShowLoadingWidget();
                  }
                  return CustomBottom(
                    title: 'Confirm',
                    height: 60.h,
                    width: double.infinity,
                    ontap: () async {
                      if (formKey.currentState!.validate()) {
                        await cubit.changePassword(data: {
                          'old_password': currentPassword.text,
                          'password': newPassword.text,
                          'confirm_password': confirmPassword.text,
                        });
                      }
                    },
                    color: AppColor.black,
                  );
                },
              ),
              50.hs
            ],
          ),
        ),
      ),
    );
  }

  String? _validator(String? value, ChangePasswordCubit cubit) {
    if (value!.isEmpty) {
      return 'Enter Password';
    } else if (confirmPassword.text != newPassword.text) {
      return 'The two passwords must match';
    } else {
      return null;
    }
  }
}
