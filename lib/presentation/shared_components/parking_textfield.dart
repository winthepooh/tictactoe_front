import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tictactoe/common/styles/app_text_style.dart';

class ParkingTextField extends StatelessWidget {
  final Icon? labelIconPrefix;
  final String? labelText;
  final double? labelSize;
  final TextStyle? labelStyle;
  final String? hintText;
  final TextStyle? hintStyle;
  final TextEditingController? controller;
  final Widget? counter;
  final bool? isPassword;
  final List<TextInputFormatter>? formatter;
  const ParkingTextField({
    super.key,
    this.labelIconPrefix,
    this.hintStyle,
    this.hintText,
    this.labelSize,
    this.labelStyle,
    this.labelText,
    this.controller,
    this.isPassword,
    this.counter,
    this.formatter,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      inputFormatters: formatter,
      controller: controller,
      obscureText: isPassword != null && isPassword == true ? true : false,
      decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          counter: counter,
          label: labelText != null
              ? SizedBox(
                  width: labelSize != null ? labelSize!.w : 190.w,
                  child: Row(
                    children: [
                      labelIconPrefix != null
                          ? labelIconPrefix!
                          : Container(
                              width: 0,
                            ),
                      Text(
                        " ${labelText!}",
                        style: labelStyle ??
                            AppTextStyle.popBlackBoldTextStyle
                                .copyWith(fontSize: 12), //pop12BoldTextBlack
                      )
                    ],
                  ),
                )
              : Container(
                  width: 0,
                ),
          hintStyle: hintStyle ??
              AppTextStyle.popBlackRegularTextStyle.copyWith(
                  fontSize: 12, color: Colors.grey[400]), //pop12NormalTextBlack
          hintText: hintText ?? "",
          contentPadding:
              EdgeInsets.symmetric(horizontal: 38.w, vertical: 20.h),
          alignLabelWithHint: true,
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black),
              borderRadius: BorderRadius.circular(200)),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(200))),
    );
  }
}
