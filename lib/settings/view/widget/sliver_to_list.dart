import 'package:educationapp/core/data/local_data/get_data_of_user.dart';
import 'package:educationapp/core/data/local_data/shared_prefrance.dart';
import 'package:educationapp/core/extention/extention.dart';
import 'package:educationapp/core/router/app_router_name.dart';
import 'package:educationapp/core/style/app_color.dart';
import 'package:educationapp/core/style/text_style.dart';
import 'package:educationapp/core/util/app_const.dart';
import 'package:educationapp/core/widget/custom_bottom.dart';
import 'package:educationapp/settings/view/widget/item_Settings.dart';
import 'package:educationapp/settings/view/widget/show_alaer_dialog_to_help.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SliverToList extends StatelessWidget {
  const SliverToList({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ItemSettings> allItemSettings = [
      ItemSettings(
          preficeIcon: Icons.person,
          titile: 'Edit Password',
          onTap: () =>
              Navigator.of(context).pushNamed(AppRouterName.editPassword)),
      ItemSettings(
          preficeIcon: FontAwesomeIcons.lock,
          titile: 'Privacy Policy',
          onTap: () {}),
      ItemSettings(
          preficeIcon: Icons.help,
          titile: 'Help Centre',
          onTap: () {
            showDialog(
                context: context,
                builder: (context) => const ShowDialogToHelp());
          }),
      ItemSettings(
          preficeIcon: Icons.logout,
          titile: 'Log Out',
          onTap: () {
            showDialog(
                context: context,
                builder: (context) => const ShowAlerDialogToLogout());
          }),
    ];

    return SliverList.builder(
        itemCount: allItemSettings.length,
        itemBuilder: (context, index) => allItemSettings[index]);
  }
}

class ShowAlerDialogToLogout extends StatelessWidget {
  const ShowAlerDialogToLogout({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color(0xff7C6316),
      title: Text('Log out of your account ?', style: Style.textStyle20),
      content: Row(
        children: [
          Expanded(
              child: _buildbottom(
                  ontap: () async {
                    await MySharedPrefrence.remove(AppConst.token);
                    GetUserFromLockel.remove();
                    // ignore: use_build_context_synchronously
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        AppRouterName.loginScreen, (route) => false);
                  },
                  titile: 'Log out',
                  color: Colors.red)),
          20.ws,
          Expanded(
              child: _buildbottom(
                  ontap: () => Navigator.of(context).pop(),
                  titile: 'Cancel',
                  color: AppColor.kPeimeryColor)),
        ],
      ),
    );
  }

  Widget _buildbottom(
      {required String titile,
      required Color color,
      required VoidCallback ontap}) {
    return CustomBottom(
        title: titile, height: 30.h, width: 85.w, ontap: ontap, color: color);
  }
}
