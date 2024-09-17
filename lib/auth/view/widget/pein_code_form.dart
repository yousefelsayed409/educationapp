import 'package:educationapp/auth/manager/cubit/authentication_cubit.dart';
import 'package:educationapp/auth/view/reser_password.dart';
import 'package:educationapp/core/extention/extention.dart';
import 'package:educationapp/core/router/app_router_name.dart';
import 'package:educationapp/core/style/app_color.dart';
import 'package:educationapp/core/style/text_style.dart';
import 'package:educationapp/core/widget/custom_bottom.dart';
import 'package:educationapp/core/widget/flutter_toaster.dart';
import 'package:educationapp/core/widget/show_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timer_count_down/timer_count_down.dart';

class PinCodeFieldsForm extends StatefulWidget {
  const PinCodeFieldsForm({super.key, required this.email});
  final String email;
  @override
  State<PinCodeFieldsForm> createState() => _PinCodeFieldsFormState();
}

class _PinCodeFieldsFormState extends State<PinCodeFieldsForm> {
  late TextEditingController firstPinCodeController;
  late TextEditingController secondPinCodeController;
  late TextEditingController thirtPinCodeController;
  late TextEditingController fourthPinCodeController;
  String secretCode = '';

  @override
  void initState() {
    firstPinCodeController = TextEditingController();
    secondPinCodeController = TextEditingController();
    thirtPinCodeController = TextEditingController();
    fourthPinCodeController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<AuthenticationCubit>(context);

    return Column(
      children: [
        70.hs,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildSinglePinCodeField(context, firstPinCodeController),
            _buildFieldsSpacer(context),
            _buildSinglePinCodeField(context, secondPinCodeController),
            _buildFieldsSpacer(context),
            _buildSinglePinCodeField(context, thirtPinCodeController),
            _buildFieldsSpacer(context),
            _buildSinglePinCodeField(context, fourthPinCodeController),
          ],
        ),
        40.hs,
        BlocConsumer<AuthenticationCubit, AuthenticationState>(
          listener: (context, state) {
            if (state is AuthenticationIsFailuer) {
              flutterToast(message: state.errorMessage);
            } else if (state is AuthenticationIsSuccess) {
              flutterToast(message: 'Chnage Password');
              Navigator.of(context).pushReplacementNamed(
                  AppRouterName.resetPassword,
                  arguments:
                      RestPasswordModel(code: secretCode, email: widget.email));
            }
          },
          builder: (context, state) {
            if (state is AuthenticationIsLoading) {
              return const ShowLoadingWidget();
            }
            return CustomBottom(
                title: 'Send code',
                height: 55.h,
                width: double.infinity,
                ontap: () {
                  if (secretCode.length == 4) {
                    cubit.checkCode(
                        data: {'email': widget.email, 'code': secretCode});
                  } else {
                    flutterToast(message: 'Enter the code correctly');
                  }
                },
                color: AppColor.black);
          },
        ),
        20.hs,
        const ShowTimer()
      ],
    );
  }

  @override
  void dispose() {
    firstPinCodeController.dispose();
    secondPinCodeController.dispose();
    thirtPinCodeController.dispose();
    fourthPinCodeController.dispose();

    super.dispose();
  }

  Widget _buildSinglePinCodeField(
      BuildContext context, TextEditingController? pinCodeController) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.18,
      child: TextFormField(
        controller: pinCodeController,
        autofocus: true,
        cursorRadius: const Radius.circular(12),
        onChanged: (value) {
          if (value.isEmpty && firstPinCodeController.text.isNotEmpty) {
            FocusScope.of(context).previousFocus();
          }
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
            setState(() {
              secretCode = '';
              secretCode += firstPinCodeController.text;
              secretCode += secondPinCodeController.text;
              secretCode += thirtPinCodeController.text;
              secretCode += fourthPinCodeController.text;
              print('secretdcode = $secretCode');
            });
          }
        },
        keyboardType: TextInputType.number,
        maxLength: 1,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.titleLarge,
        cursorOpacityAnimates: true,
        cursorWidth: 2.4,
        cursorColor: AppColor.kPeimeryColor,
        decoration: const InputDecoration(
          filled: true,
          fillColor: AppColor.white,
          counterText: '',
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            borderSide: BorderSide(color: AppColor.kPeimeryColor, width: 2),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            borderSide: BorderSide(color: Colors.grey),
          ),
        ),
      ),
    );
  }

  SizedBox _buildFieldsSpacer(BuildContext context) {
    return SizedBox(width: MediaQuery.of(context).size.width * 0.04);
  }
}

class ShowTimer extends StatelessWidget {
  const ShowTimer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: Row(
        children: [
          Text('Send code again', style: Style.textStyle16),
          const Spacer(flex: 1),
          Countdown(
            seconds: 120,
            build: (BuildContext context, double time) {
              int minutes = time ~/ 60;
              int seconds = time.toInt() % 60;
              String timerText =
                  '$minutes:${seconds.toString().padLeft(2, '0')}';
              return Text(timerText);
            },
            interval: const Duration(seconds: 1),
            onFinished: () {
              print('Timer is done!');
            },
          ),
        ],
      ),
    );
  }
}
