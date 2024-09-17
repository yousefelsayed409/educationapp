import 'package:educationapp/core/extention/extention.dart';
import 'package:educationapp/core/style/text_style.dart';
import 'package:flutter/material.dart';

class DoYouPayment extends StatefulWidget {
  const DoYouPayment({super.key});

  @override
  State<DoYouPayment> createState() => _DoYouPaymentState();
}

class _DoYouPaymentState extends State<DoYouPayment> {
  List<bool> isClick = [false, false];
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Do you want the certificate to reach you?',
                style: Style.textStyle16.copyWith(fontWeight: FontWeight.w700)),
            12.hs,
            Checkbox(
              value: isClick[0],
              onChanged: (value) {
                isClick[0] = value!;
                setState(() {});
              },
            ),
            Checkbox(
              value: isClick[1],
              onChanged: (value) {
                isClick[1] = value!;
                setState(() {});
              },
            )
          ],
        ),
      ],
    );
  }
}
