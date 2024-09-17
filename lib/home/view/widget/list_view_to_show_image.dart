import 'package:educationapp/core/util/app_image.dart';
import 'package:flutter/material.dart';

class SliverListView extends StatelessWidget {
  const SliverListView({super.key});
  static const List<String> image = [
    AppImageAssets.imag1,
    AppImageAssets.imag2,
    AppImageAssets.imag3,
    AppImageAssets.imag4,
    AppImageAssets.imag5,
    AppImageAssets.imag6,
    AppImageAssets.imag7,
  ];
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
        child: SizedBox(
      height: MediaQuery.sizeOf(context).width * .9,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: image.length,
            itemBuilder: (context, index) => Image.asset(image[index])),
      ),
    ));
  }
}
