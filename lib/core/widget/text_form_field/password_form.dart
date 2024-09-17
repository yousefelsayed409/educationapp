import 'package:flutter/material.dart';
import 'package:educationapp/core/validation/validation.dart';
import 'package:educationapp/core/widget/text_form_field/custom_text_form_field.dart';

class PasswordFormField extends StatelessWidget {
  const PasswordFormField({super.key, required this.controller});
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return CustomTextFormFiled(
      hint: 'Password',
      onChanged: (String? value) {
        controller.text = value!;
      },
      validate: ValidationForm.passwordValidator,
      isPassword: true,
      controller: controller,
    );
  }
}
