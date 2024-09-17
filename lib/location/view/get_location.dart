import 'package:educationapp/core/extention/extention.dart';
import 'package:educationapp/core/router/app_router_name.dart';
import 'package:educationapp/core/style/app_color.dart';
import 'package:educationapp/core/style/text_style.dart';
import 'package:educationapp/core/util/app_image.dart';
import 'package:educationapp/core/widget/custom_bottom.dart';
import 'package:educationapp/core/widget/text_form_field/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class GetLocation extends StatelessWidget {
  const GetLocation({super.key});
  static final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  12.hs,
                  Text(
                    'Specify your address',
                    style: Style.textStyle24,
                  ),
                  12.hs,
                  Image.asset(AppImageAssets.maps),
                  22.hs,
                  Row(
                    children: [
                      Expanded(
                          child: Divider(
                              color: AppColor.black.withOpacity(.5),
                              thickness: 1)),
                      8.ws,
                      const Text('or'),
                      8.ws,
                      Expanded(
                          child: Divider(
                              color: AppColor.black.withOpacity(.5),
                              thickness: 1)),
                    ],
                  ),
                  showForm(
                    width: double.infinity,
                    title: 'Governorate',
                    validate: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'enter Governorate';
                      }
                      return null;
                    },
                  ),
                  showForm(
                    width: double.infinity,
                    title: 'Street addrees',
                    validate: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'enter Governorate';
                      }
                      return null;
                    },
                  ),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text('City&State', style: Style.textStyle16)),
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextFormFiled(
                          hint: 'City',
                          onChanged: (String? value) {},
                          validate: (String? value) {
                            return null;
                          },
                          isPassword: false,
                          controller: TextEditingController(),
                        ),
                      ),
                      14.ws,
                      Expanded(
                        child: CustomTextFormFiled(
                          hint: 'State',
                          onChanged: (String? value) {},
                          validate: (String? value) {
                            return null;
                          },
                          isPassword: false,
                          controller: TextEditingController(),
                        ),
                      )
                    ],
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: showForm(
                      width: MediaQuery.sizeOf(context).width * .4,
                      title: 'Center',
                      validate: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'enter Governorate';
                        }
                        return null;
                      },
                    ),
                  ),
                  40.hs,
                  Align(
                    alignment: Alignment.centerRight,
                    child: CustomBottom(
                      color: AppColor.kPeimeryColor,
                      title: 'Next',
                      ontap: () {
                        if (formKey.currentState!.validate()) {
                          Navigator.of(context)
                              .pushNamed(AppRouterName.chossePayment);
                        }
                      },
                      width: 100,
                      height: 40,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget showForm({
    required double width,
    required String title,
    required String? Function(String?) validate,
  }) {
    return SizedBox(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 8.hs,
          Text(title, style: Style.textStyle16),

          CustomTextFormFiled(
            hint: title,
            onChanged: (String? value) {},
            validate: validate,
            isPassword: false,
            controller: TextEditingController(),
          ),
        ],
      ),
    );
  }
}
