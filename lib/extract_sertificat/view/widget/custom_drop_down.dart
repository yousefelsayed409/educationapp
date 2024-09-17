import 'package:educationapp/core/extention/extention.dart';
import 'package:educationapp/core/style/app_color.dart';
import 'package:educationapp/core/style/text_style.dart';
import 'package:educationapp/extract_sertificat/manager/cubit/certificate_cubit.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomDropDownCertificat extends StatefulWidget {
  const CustomDropDownCertificat({super.key});

  @override
  State<CustomDropDownCertificat> createState() =>
      _CustomDropDownCertificatState();
}

class _CustomDropDownCertificatState extends State<CustomDropDownCertificat> {
  List<String> items = ['Bioinformatics', 'Software', 'AI', 'IS', 'IT', 'CS'];
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<CertificateCubit>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        20.hs,
        Text('Department',
            style: Style.textStyle16.copyWith(fontWeight: FontWeight.w700)),
        8.hs,
        Container(
          height: 55,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(width: 2, color: AppColor.kPeimeryColor)),
          child: DropdownButtonHideUnderline(
            child: DropdownButton2<String>(
              isExpanded: true,
              hint: Text(
                'Select your department',
                style: TextStyle(
                  fontSize: 14,
                  color: Theme.of(context).hintColor,
                ),
              ),
              items: items
                  .map((String item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ))
                  .toList(),
              value: selectedValue,
              onChanged: (String? value) {
                setState(() {
                  cubit.departMent = value;
                  selectedValue = value;
                });
              },
              buttonStyleData: const ButtonStyleData(
                padding: EdgeInsets.symmetric(horizontal: 16),
                height: 40,
                width: 140,
              ),
              menuItemStyleData: const MenuItemStyleData(
                height: 40,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
