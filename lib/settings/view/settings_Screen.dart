// ignore: file_names
import 'package:educationapp/settings/view/widget/custom_slievr_app_bar.dart';
import 'package:educationapp/settings/view/widget/sliver_to_list.dart';
import 'package:educationapp/settings/view/widget/some_data_of_user.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: [
          CustomSliverAppBar(),
          SomeDataofUsre(),
          SliverToList(),
        ],
      ),
    );
  }
}
