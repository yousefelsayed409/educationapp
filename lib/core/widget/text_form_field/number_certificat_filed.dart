import 'package:educationapp/core/extention/extention.dart';
import 'package:flutter/material.dart';
import 'package:educationapp/core/style/text_style.dart';
import 'package:educationapp/core/widget/text_form_field/custom_text_form_field.dart';

class NumberCertificatField extends StatelessWidget {
  const NumberCertificatField({super.key, required this.controllre});
  final TextEditingController controllre;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Number of certificates',
            style: Style.textStyle16.copyWith(fontWeight: FontWeight.w700)),
        8.hs,
        CustomTextFormFiled(
          inputType: TextInputType.number,
          hint: 'enter number of certificates you want',
          onChanged: (String value) {
            controllre.text = value;
          },
          validate: (String? value) {
            if (value == null || value.isEmpty) {
              return 'Field is required';
            } else {
              return null;
            }
          },
          isPassword: false,
          controller: controllre,
        )
      ],
    );
  }
}
