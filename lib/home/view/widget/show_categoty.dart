import 'package:educationapp/core/extention/extention.dart';
import 'package:educationapp/core/router/app_router_name.dart';
import 'package:educationapp/core/style/app_color.dart';
import 'package:educationapp/core/style/text_style.dart';
import 'package:educationapp/core/util/app_image.dart';
import 'package:educationapp/core/widget/custom_bottom.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShowCategroy extends StatelessWidget {
  const ShowCategroy({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      hasScrollBody: false,
      child: Container(
        margin: const EdgeInsets.only(top: 25),
        decoration: const BoxDecoration(
          color: Color(0xffD6CFB7),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(230),
            bottomLeft: Radius.circular(200),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              50.hs,
              Padding(
                padding: const EdgeInsets.only(left: 12),
                child: _showCategory(
                    title: 'Grades questionnaire',
                    ontap: () => Navigator.of(context)
                        .pushNamed(AppRouterName.gradesQuestion),
                    alignment: Alignment.centerLeft),
              ),
              _showCategory(
                  title: 'Extracting The Certificate',
                  ontap: () => Navigator.of(context)
                      .pushNamed(AppRouterName.extractCertificat),
                  alignment: Alignment.center),
              _showCategory(
                  title: 'Certificate Documenting',
                  ontap: () {
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              backgroundColor: const Color(0xff7C6316),
                              title: Text(
                                  'Do You Want To Authenticate The Certificate ?',
                                  style: Style.textStyle20),
                              content: Row(
                                children: [
                                  Expanded(
                                    child: CustomBottom(
                                      title: 'Yes',
                                      height: 44,
                                      width: 22,
                                      ontap: () {
                                        Navigator.pop(context);
                                        Navigator.of(context).pushNamed(
                                            AppRouterName.certificatdoc);
                                      },
                                      color: AppColor.kPeimeryColor,
                                    ),
                                  ),
                                  12.ws,
                                  Expanded(
                                    child: CustomBottom(
                                      title: 'No',
                                      height: 44,
                                      width: 22,
                                      ontap: () => Navigator.pop(context),
                                      color: const Color(0xffC7B06C),
                                    ),
                                  )
                                ],
                              ),
                            ));
                  },
                  alignment: Alignment.centerRight),
            ],
          ),
        ),
      ),
    );
  }

  Widget _showCategory(
      {required String title,
      required VoidCallback ontap,
      required AlignmentGeometry alignment}) {
    return Align(
      alignment: alignment,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          InkWell(
            onTap: ontap,
            child: Container(
              margin: const EdgeInsets.only(bottom: 40),
              alignment: Alignment.center,
              width: 143,
              height: 80,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                  color: AppColor.black,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColor.kPeimeryColor, width: 2)),
              child: Text(
                textAlign: TextAlign.center,
                title,
                style: Style.textStyle16.copyWith(
                    color: AppColor.white, fontWeight: FontWeight.w700),
              ),
            ),
          ),
          Positioned(
              // bottom: 0,
              top: -40,
              left: -20,
              child: Image.asset(AppImageAssets.hate))
        ],
      ),
    );
  }
}
