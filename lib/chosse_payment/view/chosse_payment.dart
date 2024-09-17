import 'package:educationapp/core/extention/extention.dart';
import 'package:educationapp/core/router/app_router_name.dart';
import 'package:educationapp/core/style/app_color.dart';
import 'package:educationapp/core/style/text_style.dart';
import 'package:educationapp/core/widget/custom_bottom.dart';
import 'package:educationapp/core/widget/flutter_toaster.dart';
import 'package:educationapp/core/widget/show_loading.dart';
import 'package:educationapp/payment/manager/cubit/payment_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChossePayment extends StatefulWidget {
  const ChossePayment({super.key});

  @override
  State<ChossePayment> createState() => _ChossePaymentState();
}

class _ChossePaymentState extends State<ChossePayment> {
  List<bool> isClick = [false, false];
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PaymentCubit(),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                40.hs,
                Text('Select payment method', style: Style.textStyle24),
                8.hs,
                Text('Certificate price : 150 L.E.',
                    style: Style.textStyle20.copyWith(color: AppColor.black)),
                8.hs,
                Text('Delivery price : 30 L.E.',
                    style: Style.textStyle20.copyWith(color: AppColor.black)),
                8.hs,
                Row(
                  children: [
                    Text('Total',
                        style: Style.textStyle20
                            .copyWith(color: AppColor.kPeimeryColor)),
                    Text(': 270 L.E.',
                        style:
                            Style.textStyle20.copyWith(color: AppColor.black)),
                  ],
                ),
                40.hs,
                Text('Choose your best payment method .',
                    style: Style.textStyle24),
                20.hs,
                Row(
                  children: [
                    Checkbox(
                        value: isClick[0],
                        onChanged: (value) {
                          isClick[0] = value!;
                          isClick[1] = false;
                          setState(() {});
                        }),
                    Text(
                      'Credit card',
                      style: Style.textStyle24,
                    )
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                        value: isClick[1],
                        onChanged: (value) {
                          isClick[1] = value!;
                          isClick[0] = false;

                          setState(() {});
                        }),
                    Text(
                      'Fawry',
                      style: Style.textStyle24,
                    )
                  ],
                ),
                20.hs,
                BlocConsumer<PaymentCubit, PaymentState>(
                  listener: (context, state) {
                    if (state is PaymentIsFailuer) {
                      flutterToast(message: state.errorMessage);
                    } else if (state is PaymentIsSuccess) {
                      Navigator.of(context).pushNamed(
                          AppRouterName.paymentWithCard,
                          arguments:
                              'https://accept.paymob.com/api/acceptance/iframes/770221?payment_token=${BlocProvider.of<PaymentCubit>(context).paymentKey}');
                    }
                  },
                  builder: (context, state) {
                    if (state is PaymentIsLoading) {
                      return const ShowLoadingWidget();
                    }
                    return CustomBottom(
                        title: 'Next',
                        height: 55,
                        width: double.infinity,
                        ontap: () async =>
                            await BlocProvider.of<PaymentCubit>(context)
                                .paymentbyCard(
                                    amount: '15000', idCard: 3972142),
                        color: AppColor.kPeimeryColor);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
