import 'package:educationapp/core/extention/extention.dart';
import 'package:educationapp/core/router/app_router_name.dart';
import 'package:educationapp/core/style/app_color.dart';
import 'package:educationapp/core/widget/custom_bottom.dart';
import 'package:educationapp/core/widget/flutter_toaster.dart';
import 'package:educationapp/core/widget/show_loading.dart';
import 'package:educationapp/core/widget/text_form_field/nation_id_form.dart';
import 'package:educationapp/core/widget/text_form_field/number_certificat_filed.dart';
import 'package:educationapp/core/widget/text_form_field/user_name_formd_fiekd.dart';
import 'package:educationapp/extract_sertificat/manager/cubit/certificate_cubit.dart';
import 'package:educationapp/extract_sertificat/view/widget/custom_drop_down.dart';
import 'package:educationapp/extract_sertificat/view/widget/enter_lang.dart';
import 'package:educationapp/extract_sertificat/view/widget/get_image_personal.dart';
import 'package:educationapp/extract_sertificat/view/widget/graduation_year.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FormToExtractCertificate extends StatefulWidget {
  const FormToExtractCertificate({super.key});

  @override
  State<FormToExtractCertificate> createState() =>
      _FormToExtractCertificateState();
}

class _FormToExtractCertificateState extends State<FormToExtractCertificate> {
  late TextEditingController name;
  // late TextEditingController email;
  late TextEditingController nationalId;
  late TextEditingController numberCertificat;
  @override
  void initState() {
    name = TextEditingController();
    // email = TextEditingController();
    nationalId = TextEditingController();
    numberCertificat = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    numberCertificat.dispose();
    // email.dispose();
    nationalId.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<CertificateCubit>(context);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            UserNameField(controller: name, isShowText: 'Full Name'),
            // EmailFormField(
            //   controller: email,
            //   isShowText: 'E_mail',
            // ),
            NationalIdForm(controller: nationalId, isShowText: 'National id'),
            const EnterLangCertificat(),
            const CustomDropDownCertificat(),
            NumberCertificatField(
              controllre: numberCertificat,
            ),
            const GradeionYear(),
            const GetImagePersonalPhoto(),
            20.hs,
            // const DoYouPayment(),
            BlocConsumer<CertificateCubit, CertificateState>(
              listener: (context, state) {
                if (state is Failure) {
                  flutterToast(message: state.errorMessage);
                } else if (state is Success) {
                  gradeionYear = null;
                  flutterToast(message: 'Successfully documented');
                  Navigator.of(context).pushNamed(AppRouterName.getLocation);
                }
              },
              builder: (context, state) {
                if (state is Loading) {
                  return const ShowLoadingWidget();
                }
                return CustomBottom(
                    title: 'Send',
                    height: 55,
                    width: double.infinity,
                    ontap: () async {
                      if (name.text.isEmpty ||
                          nationalId.text.isEmpty ||
                          numberCertificat.text.isEmpty ||
                          cubit.departMent == null ||
                          gradeionYear == null ||
                          cubit.imagePhoto == null ||
                          cubit.imagePhotoId == null ||
                          cubit.lang == null) {
                        flutterToast(message: 'Enter the data correctly');
                      } else {
                        String fileNameimagePhoto =
                            cubit.imagePhoto!.path.split('/').last;
                        String fileNameimagePhotoId =
                            cubit.imagePhotoId!.path.split('/').last;

                        await cubit.certificate(
                          data: {
                            "name": name.text,
                            "national_id": nationalId.text,
                            "lang": cubit.lang,
                            "department": cubit.departMent,
                            "type": "2",
                            "image": await MultipartFile.fromFile(
                              cubit.imagePhoto!.path,
                              filename: fileNameimagePhoto,
                            ),
                            "image_id": await MultipartFile.fromFile(
                              cubit.imagePhotoId!.path,
                              filename: fileNameimagePhotoId,
                            ),
                            "number_certificate": numberCertificat.text,
                            "graduation_year": gradeionYear,
                            "type_payment": "cash"
                          },
                        );
                      }
                    },
                    color: AppColor.kPeimeryColor);
              },
            ),
            20.hs
          ],
        ),
      ),
    );
  }
}
