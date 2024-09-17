import 'package:educationapp/core/style/text_style.dart';
import 'package:educationapp/core/validation/validation.dart';
import 'package:educationapp/core/widget/text_form_field/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class EmailFormField extends StatelessWidget {
  const EmailFormField({super.key, required this.controller, this.isShowText});
  final TextEditingController controller;
  final String? isShowText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        isShowText == null
            ? const SizedBox()
            : Padding(
                padding: const EdgeInsets.symmetric(vertical: 2),
                child: Text(
                  isShowText!,
                  style:
                      Style.textStyle16.copyWith(fontWeight: FontWeight.w700),
                ),
              ),
        CustomTextFormFiled(
          hint: 'Enter your email',
          onChanged: (String? value) {
            controller.text = value!;
          },
          validate: ValidationForm.emailValidator,
          isPassword: false,
          controller: controller,
        ),
      ],
    );
  }
}
