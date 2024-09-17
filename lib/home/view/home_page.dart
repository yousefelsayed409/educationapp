import 'package:educationapp/core/router/app_router_name.dart';
import 'package:educationapp/core/style/text_style.dart';
import 'package:educationapp/home/view/widget/list_view_to_show_image.dart';
import 'package:educationapp/home/view/widget/show_categoty.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  void initState() {
    // GetUserFromLockel.init();
    // print(GetUserFromLockel.userModel!.userName);
    super.initState();
  }

  // Position? position;
  // String nameLoaction = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home',
          style: Style.textStyle24,
        ),
        actions: [
          IconButton(
            onPressed: () =>
                Navigator.of(context).pushNamed(AppRouterName.settingsScreen),
            icon: const Icon(
              FontAwesomeIcons.user,
              size: 16,
            ),
          ),
          IconButton(
            onPressed: () =>
                Navigator.of(context).pushNamed(AppRouterName.notification),
            icon: const Icon(
              FontAwesomeIcons.bell,
              size: 16,
            ),
          ),
        ],
      ),
      body: const CustomScrollView(
        slivers: [SliverListView(), ShowCategroy()],
      ),
    );
  }
}























  // Future<String> getAddress(double latitude, double longitude) async {
  //   try {
  //     List<Placemark> placemarks =
  //         await placemarkFromCoordinates(latitude, longitude);
  //     if (placemarks != null && placemarks.isNotEmpty) {
  //       Placemark placemark = placemarks[0];
  //       // String address = "${placemark.street}, ${placemark.subLocality}, ${placemark.locality}, ${placemark.country}";
  //       print(placemark.street.toString());
  //       return placemark.street!;
  //     } else {
  //       return "No address found for the provided coordinates.";
  //     }
  //   } catch (e) {
  //     return "Error getting address: $e";
  //   }
  // }



  // void _shodialog(BuildContext context, String title) {
  //   AwesomeDialog(
  //     context: context,
  //     dialogType: DialogType.error,
  //     animType: AnimType.rightSlide,
  //     title: title,
  //     // btnCancelOnPress: () {},
  //     // btnOkOnPress: () {},
  //   ).show();
  // }



























// Center(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 CustomBottom(
//                     title: 'اذهب الى الاعدادات  ',
//                     height: 55.h,
//                     width: double.infinity,
//                     ontap: () {
//                       Navigator.of(context)
//                           .pushNamed(AppRouterName.settingsScreen);
//                     },
//                     color: AppColor.black),
//                 12.hs,
//                 BlocConsumer<PaymentCubit, PaymentState>(
//                   listener: (context, state) async {
//                     if (state is PaymentIsFailuer) {
//                       flutterToast(message: state.errorMessage);
//                     } else if (state is PaymentIsSuccess) {
//                       try {
//                         String paymentKey =
//                             BlocProvider.of<PaymentCubit>(context).paymentKey;
//                         String url =
//                             'https://accept.paymob.com/api/acceptance/iframes/770221?payment_token=$paymentKey';
//                         Navigator.of(context).pushNamed(
//                             AppRouterName.paymentWithCard,
//                             arguments: url);
//                       } catch (e) {
//                         flutterToast(message: e.toString());
//                       }
//                     }
//                   },
//                   builder: (context, state) {
//                     if (state is PaymentIsLoading) {
//                       return const ShowLoadingWidget();
//                     } else {
//                       return CustomBottom(
//                           title: 'الدفع من خلال الفيزا',
//                           height: 55.h,
//                           width: double.infinity,
//                           ontap: () async {
//                             await BlocProvider.of<PaymentCubit>(context)
//                                 .paymentbyCard(
//                                     idCard: 3972142,
//                                     amount: (200 * 100).toString());
//                           },
//                           color: AppColor.black);
//                     }
//                   },
//                 ),
//                 12.hs,
//                 CustomBottom(
//                     title: 'تحديد المكان  ',
//                     height: 55.h,
//                     width: double.infinity,
//                     ontap: () async {
//                       LocationPermission permission;

//                       bool serviceEnabled =
//                           await Geolocator.isLocationServiceEnabled();
//                       if (serviceEnabled == false) {
//                         _shodialog(
//                           // ignore: use_build_context_synchronously
//                           context,
//                           'قم بتشغيل خدمة الموقع من على جهازك لكى نتمكن من الوصول اليك ',
//                         );
//                       } else {
//                         permission = await Geolocator.checkPermission();
//                         if (permission == LocationPermission.denied) {
//                           permission = await Geolocator.requestPermission();
//                         }
//                         if (permission == LocationPermission.whileInUse) {
//                           position = await Geolocator.getCurrentPosition();

//                           nameLoaction = await getAddress(
//                               position!.latitude, position!.longitude);
//                           setState(() {});
//                         }
//                       }
//                     },
//                     color: AppColor.black),
//                 20.hs,
//                 Text(position.toString(), style: Style.textStyle16),
//                 Text(nameLoaction, style: Style.textStyle16)
//               ],
//             ),
//           ),
//         ),
      