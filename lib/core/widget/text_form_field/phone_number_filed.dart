import 'package:flutter/material.dart';
import 'package:educationapp/core/style/text_style.dart';
import 'package:educationapp/core/validation/validation.dart';
import 'package:educationapp/core/widget/text_form_field/custom_text_form_field.dart';

class PhoneNumberFiled extends StatelessWidget {
  const PhoneNumberFiled({super.key, required this.controllre});
  final TextEditingController controllre;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Phone Number ',
            style: Style.textStyle16.copyWith(fontWeight: FontWeight.w700)),
        CustomTextFormFiled(
          inputType: TextInputType.number,
          hint: 'enter your Phone Number',
          onChanged: (String value) {
            controllre.text = value;
          },
          validate: ValidationForm.phoneValidator,
          isPassword: false,
          controller: controllre,
        )
      ],
    );
  }
}
