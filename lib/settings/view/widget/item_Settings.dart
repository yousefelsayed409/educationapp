import 'package:educationapp/core/extention/extention.dart';
import 'package:educationapp/core/style/app_color.dart';
import 'package:educationapp/core/style/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ItemSettings extends StatelessWidget {
  const ItemSettings(
      {super.key,
      required this.preficeIcon,
      // required this.suffixIcon,
      required this.titile,
      required this.onTap});
  final IconData preficeIcon;
  // final IconData suffixIcon;
  final String titile;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
      child: InkWell(
        splashColor: AppColor.white,
        onTap: onTap,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 22),
              child: Row(
                children: [
                  Icon(preficeIcon, size: 16, color: AppColor.kPeimeryColor),
                  12.ws,
                  Text(titile, style: Style.textStyle16),
                  const Spacer(flex: 1),
                  const Icon(
                    FontAwesomeIcons.chevronRight,
                    color: AppColor.kPeimeryColor,
                    size: 16,
                  ),
                ],
              ),
            ),
            2.hs,
            Divider(
              color: Colors.grey.withOpacity(.5),
              thickness: 1,
            )
          ],
        ),
      ),
    );
  }
}
