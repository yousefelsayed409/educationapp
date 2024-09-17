import 'package:educationapp/core/extention/extention.dart';
import 'package:educationapp/core/router/app_router_name.dart';
import 'package:educationapp/core/style/app_color.dart';
import 'package:educationapp/core/style/text_style.dart';
import 'package:educationapp/core/util/app_image.dart';
import 'package:educationapp/core/widget/custom_bottom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CertificatDoc extends StatelessWidget {
  const CertificatDoc({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            50.hs,
            InkWell(
              onTap: () => Navigator.pop(context),
              child: Image.asset(AppImageAssets.certificar_doc),
            ),
            20.hs,
            Text('Stay connected',
                style: Style.textStyle36.copyWith(color: AppColor.black)),
            12.hs,
            Text(
              'Lorenm lpsum dolar sit amet, Lorenm lpsum dolar sit amet, Lorenm lpsum dolar sit amet ',
              style: Style.textStyle16
                  .copyWith(color: Colors.grey.withOpacity(.6)),
            ),
            100.hs,
            Row(
              children: [
                Expanded(
                    child: InkWell(
                  onTap: () => Navigator.of(context)
                      .pushNamed(AppRouterName.gradesQuestion),
                  child: Container(
                    alignment: Alignment.center,
                    height: 70.h,
                    decoration: BoxDecoration(
                        color: const Color(0xff7C6316),
                        borderRadius: BorderRadius.circular(16)),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Grades',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Text('questionnaire',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white))
                      ],
                    ),
                  ),
                )),
                20.ws,
                Expanded(
                  child: CustomBottom(
                    title: 'Certificate',
                    height: 70.h,
                    width: 2,
                    ontap: () => Navigator.of(context)
                        .pushNamed(AppRouterName.extractCertificat),
                    color: const Color(0xff7C6316),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
