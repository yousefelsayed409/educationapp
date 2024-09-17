import 'dart:io';
import 'package:educationapp/core/extention/extention.dart';
import 'package:educationapp/core/style/app_color.dart';
import 'package:educationapp/core/style/text_style.dart';
import 'package:educationapp/extract_sertificat/manager/cubit/certificate_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import 'package:flutter/material.dart';

class GetImagePersonalPhoto extends StatefulWidget {
  const GetImagePersonalPhoto({super.key});

  @override
  State<GetImagePersonalPhoto> createState() => _GetImagePersonalPhotoState();
}

class _GetImagePersonalPhotoState extends State<GetImagePersonalPhoto> {
  final picker = ImagePicker();

  Future getimagephoto(BuildContext context) async {
    var cubit = BlocProvider.of<CertificateCubit>(context);

    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        cubit.imagePhoto = File(pickedFile.path);
      }
    });
  }

  Future getimagephotoId(BuildContext context) async {
    var cubit = BlocProvider.of<CertificateCubit>(context);

    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        cubit.imagePhotoId = File(pickedFile.path);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<CertificateCubit>(context);
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Personal Photo',
              style: Style.textStyle16.copyWith(fontWeight: FontWeight.w700)),
          InkWell(
            onTap: () => getimagephoto(context),
            child: Container(
              width: MediaQuery.sizeOf(context).width * .4,
              height: 150,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColor.kPeimeryColor, width: 2)),
              child: cubit.imagePhoto == null
                  ? const SizedBox()
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.file(
                        cubit.imagePhoto!,
                        fit: BoxFit.fill,
                      ),
                    ),
            ),
          )
        ],
      ),
      12.hs,
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('National id Photo',
              style: Style.textStyle16.copyWith(fontWeight: FontWeight.w700)),
          InkWell(
            onTap: () => getimagephotoId(context),
            child: Container(
              width: MediaQuery.sizeOf(context).width * .4,
              height: 150,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColor.kPeimeryColor, width: 2)),
              child: cubit.imagePhotoId == null
                  ? const SizedBox()
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.file(
                        cubit.imagePhotoId!,
                        fit: BoxFit.fill,
                      ),
                    ),
            ),
          )
        ],
      )
    ]);
  }
}
