import 'package:educationapp/core/extention/extention.dart';
import 'package:educationapp/core/style/app_color.dart';
import 'package:educationapp/core/style/text_style.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.kPeimeryColor,
        title: Text(
          'Notifications',
          style: Style.textStyle24.copyWith(color: AppColor.white),
        ),
      ),
      body: ListView.builder(
          itemCount: 22,
          itemBuilder: (context, index) => const ItemNotification()),
    );
  }
}

class ItemNotification extends StatelessWidget {
  const ItemNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: Row(children: [
              const CircleAvatar(
                radius: 22,
                backgroundColor: Colors.blueAccent,
              ),
              12.ws,
              Text(
                'Your request has been answerd',
                style: Style.textStyle14
                    .copyWith(color: Colors.grey.withOpacity(.7)),
              )
            ]),
          ),
          const Divider(
            color: Colors.grey,
          )
        ],
      ),
    );
  }
}
