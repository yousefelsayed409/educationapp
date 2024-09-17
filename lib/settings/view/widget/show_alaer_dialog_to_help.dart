import 'package:educationapp/core/style/text_style.dart';
import 'package:flutter/material.dart';

class ShowDialogToHelp extends StatelessWidget {
  const ShowDialogToHelp({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color(0xff7C6316),
      title: Text('If you face any problem ', style: Style.textStyle20),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('contact us on this number', style: Style.textStyle20),
          // 4.hs,
          Text('01011122233 ', style: Style.textStyle20),
        ],
      ),
    );
  }
}
