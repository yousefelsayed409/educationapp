import 'package:educationapp/core/util/app_image.dart';
import 'package:educationapp/extract_sertificat/data/repo/home_repo_imple.dart';
import 'package:educationapp/extract_sertificat/manager/cubit/certificate_cubit.dart';
import 'package:educationapp/extract_sertificat/view/widget/form_to_extract_certificat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExtractCertificat extends StatelessWidget {
  const ExtractCertificat({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CertificateCubit(HomeRepoCertificateImple()),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          title: InkWell(
              onTap: () => Navigator.pop(context),
              child: Image.asset(AppImageAssets.iamgeBackBottom)),
        ),
        body: const FormToExtractCertificate(),
      ),
    );
  }
}
