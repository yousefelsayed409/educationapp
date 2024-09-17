import 'package:educationapp/core/extention/extention.dart';
import 'package:educationapp/core/style/app_color.dart';
import 'package:educationapp/core/style/text_style.dart';
import 'package:educationapp/extract_sertificat/manager/cubit/certificate_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GradeionYear extends StatefulWidget {
  const GradeionYear({super.key});

  @override
  State<GradeionYear> createState() => _GradeionYearState();
}

class _GradeionYearState extends State<GradeionYear> {
  String? date;
  DateTime dateTime = DateTime(2000, 2, 1);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        12.hs,
        Text(
          'Graduation Year',
          style: Style.textStyle16.copyWith(fontWeight: FontWeight.w700),
        ),
        InkWell(
          onTap: () {
            _pickDate(context);
          },
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 12),
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColor.kPeimeryColor, width: 2),
            ),
            child: date != null
                ? Text(
                    date!,
                    style: Style.textStyle14,
                  )
                : Text('enter your Graduation Year',
                    style: Style.textStyle14
                        .copyWith(color: const Color(0xff9D9D9D))),
          ),
        ),
      ],
    );
  }

  void _pickDate(BuildContext context) {
    showCupertinoModalPopup(
        context: context,
        builder: (context) {
          return Container(
            height: MediaQuery.sizeOf(context).height * .4,
            decoration: const BoxDecoration(
              color: AppColor.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.monthYear,
                initialDateTime: dateTime,
                onDateTimeChanged: (chosedate) {
                  dateTime = chosedate;
                  date = dateTime.toString();
                  date = date!.split(' ').first;
                  gradeionYear = date!;
                  setState(
                    () {},
                  );
                }),
          );
        });
  }
}

String? gradeionYear;
