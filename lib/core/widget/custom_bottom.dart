import 'package:flutter/material.dart';

class CustomBottom extends StatelessWidget {
  const CustomBottom({super.key, required this.title, required this.height, required this.width, required this.ontap, required this.color});
final String title;
final double height;
final double width;
final Color color;
final VoidCallback ontap;
  @override 
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: ontap,
      child: Container(
        alignment: Alignment.center,
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16)
        ),
        child: Text(title,style:const  TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.white)),
      ),
    );
  }
}