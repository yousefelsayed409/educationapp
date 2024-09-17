import 'package:educationapp/auth/view/create_account.dart';
import 'package:educationapp/auth/view/forget_password.dart';
import 'package:educationapp/auth/view/login_Screen.dart';
import 'package:educationapp/auth/view/otp_screen.dart';
import 'package:educationapp/auth/view/password_change.dart';
import 'package:educationapp/auth/view/reser_password.dart';
import 'package:educationapp/certificat_doc/view/certificat_doc.dart';
import 'package:educationapp/chosse_payment/view/chosse_payment.dart';
import 'package:educationapp/core/router/app_router_name.dart';
import 'package:educationapp/extract_sertificat/view/extract_certificate.dart';
import 'package:educationapp/grades_question/view/grades_question.dart';
import 'package:educationapp/home/view/home_page.dart';
import 'package:educationapp/location/view/get_location.dart';
import 'package:educationapp/notification/view/notification_screen.dart';
import 'package:educationapp/ob_boarding/on_boarding_screen.dart';
import 'package:educationapp/payment/payment_with_card.dart';
import 'package:educationapp/settings/view/edit_password.dart';
import 'package:educationapp/settings/view/settings_Screen.dart';
import 'package:educationapp/splashView/view/second_splash_view.dart';
import 'package:educationapp/splashView/view/splash_view.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRouterName.splashView:
        return SizeTransition3(const SplashView());
      case AppRouterName.getLocation:
        return SizeTransition3(const GetLocation());
      case AppRouterName.secondSplashView:
        return SizeTransition3(const SecondSplashView());
      case AppRouterName.chossePayment:
        return SizeTransition3(const ChossePayment());
      case AppRouterName.loginScreen:
        return SizeTransition5(const LoginScreen());
      case AppRouterName.forgetPassword:
        return SizeTransition5(const ForgetPassword());
      case AppRouterName.resetPassword:
        final restPasswordModel = settings.arguments as RestPasswordModel;
        return SizeTransition5(
            ResetPasswordScreen(restPasswordModel: restPasswordModel));
      case AppRouterName.otpScreen:
        final email = settings.arguments as String;
        return SizeTransition5(OtpScreen(
          email: email,
        ));
      case AppRouterName.passwordChanged:
        return SizeTransition5(const PasswordChangeScreen());
      case AppRouterName.onboarding:
        return SizeTransition5(const OnBoardingScreen());
      case AppRouterName.creatAccount:
        return SizeTransition5(const CreateAccount());
      case AppRouterName.homepage:
        return SizeTransition5(const HomePageScreen());
      case AppRouterName.settingsScreen:
        return SizeTransition5(const SettingsScreen());
      case AppRouterName.editPassword:
        return SizeTransition5(const EditPassword());
      case AppRouterName.paymentWithCard:
        final url = settings.arguments as String;
        return SizeTransition5(PaymentWithCard(
          url: url,
        ));
      // return SizeTransition5( PaymentWithCard(url: url,));
      case AppRouterName.gradesQuestion:
        return SizeTransition5(const GradesQuestion());
      case AppRouterName.extractCertificat:
        return SizeTransition5(const ExtractCertificat());
      case AppRouterName.notification:
        return SizeTransition5(const NotificationScreen());

      case AppRouterName.certificatdoc:
        return SizeTransition5(const CertificatDoc());
       
    
    }
    return null;
  }
}

class SizeTransition3 extends PageRouteBuilder {
  final Widget page;

  SizeTransition3(this.page)
      : super(
          pageBuilder: (context, animation, anotherAnimation) => page,
          transitionDuration: const Duration(seconds: 4),
          reverseTransitionDuration: const Duration(seconds: 2),
          transitionsBuilder: (context, animation, anotherAnimation, child) {
            animation = CurvedAnimation(
                curve: Curves.fastLinearToSlowEaseIn,
                parent: animation,
                reverseCurve: Curves.fastOutSlowIn);
            return Align(
              alignment: Alignment.center,
              child: SizeTransition(
                axis: Axis.horizontal,
                sizeFactor: animation,
                child: page,
                axisAlignment: 0,
              ),
            );
          },
        );
}

class SizeTransition5 extends PageRouteBuilder {
  final Widget page;

  SizeTransition5(this.page)
      : super(
          pageBuilder: (context, animation, anotherAnimation) => page,
          transitionDuration: const Duration(seconds: 2),
          // reverseTransitionDuration:const  Duration(seconds: 2),
          transitionsBuilder: (context, animation, anotherAnimation, child) {
            animation = CurvedAnimation(
                curve: Curves.fastLinearToSlowEaseIn,
                parent: animation,
                reverseCurve: Curves.fastOutSlowIn);
            return Align(
              alignment: Alignment.centerRight,
              child: SizeTransition(
                axis: Axis.horizontal,
                sizeFactor: animation,
                child: page,
                axisAlignment: 0,
              ),
            );
          },
        );
}
