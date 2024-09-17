import 'package:educationapp/core/style/app_color.dart';
import 'package:educationapp/core/style/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormFiled extends StatefulWidget {
  const CustomTextFormFiled({
    super.key,
    required this.hint,
    required this.onChanged,
    required this.validate,
    this.inputType,
    required this.isPassword,
    required this.controller,
  });
  final String hint;
  final Function(String) onChanged;
  final String? Function(String?) validate;
  final TextEditingController controller;

  final TextInputType? inputType;
  final bool isPassword;

  @override
  State<CustomTextFormFiled> createState() => _CustomTextFormFiledState();
}

class _CustomTextFormFiledState extends State<CustomTextFormFiled> {
  bool isShowPassword = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      child: TextFormField(
        controller: widget.controller,
        style: Style.textStyle14,
        cursorColor: Colors.yellow,
        cursorWidth: 2,
        obscureText: widget.isPassword == true ? isShowPassword : false,
        keyboardType: widget.inputType ?? TextInputType.text,
        validator: widget.validate,
        onChanged: widget.onChanged,
        decoration: InputDecoration(
          hintText: widget.hint,
          hintStyle: Style.textStyle14weight700,
          suffixIcon: widget.isPassword == true
              ? IconButton(
                  icon: Icon(
                    isShowPassword == true
                        ? Icons.visibility_off
                        : Icons.visibility,
                    color: AppColor.kPeimeryColor,
                  ),
                  onPressed: () {
                    isShowPassword = !isShowPassword;
                    setState(() {});
                  },
                )
              : const SizedBox(),
          filled: true, //<-- SEE HERE

          fillColor: const Color(0xffFDFDFF),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColor.kPeimeryColor,
              width: 1,
            ),
          ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red,
              width: 1,
            ),
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red,
              width: 1,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: AppColor.kPeimeryColor,
              // Color(0xff9E9E9E),
              width: 1,
            ),
          ),
          // hintStyle: const TextStyle(
          //   fontSize: 100,
          // ),
        ),
      ),
    );
  }
}
