import 'package:educationapp/core/extention/extention.dart';
import 'package:educationapp/core/style/text_style.dart';
import 'package:educationapp/extract_sertificat/manager/cubit/certificate_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EnterLangCertificat extends StatefulWidget {
  const EnterLangCertificat({super.key});

  @override
  State<EnterLangCertificat> createState() => _EnterLangCertificatState();
}

class _EnterLangCertificatState extends State<EnterLangCertificat> {
  bool isArabic = false;
  bool isEnglish = false;

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<CertificateCubit>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        20.hs,
        Text(
          ' language',
          style: Style.textStyle16.copyWith(fontWeight: FontWeight.w700),
        ),
        Row(children: [
          Checkbox(
            value: isArabic,
            onChanged: (t) {
              if (!isArabic) {
                isArabic = t!;
                cubit.lang = 'ar';
                isEnglish = false;
                setState(() {});
              }
            },
          ),
          Text(
            'Arabic',
            style: Style.textStyle14,
          ),
        ]),
        Row(children: [
          Checkbox(
            value: isEnglish,
            onChanged: (t) {
              if (!isEnglish) {
                isEnglish = t!;
                cubit.lang = 'en';

                isArabic = false;
                setState(() {});
              }
            },
          ),
          Text(
            'English',
            style: Style.textStyle14,
          ),
        ]),
      ],
    );
  }
}
