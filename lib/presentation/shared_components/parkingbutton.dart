import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tictactoe/common/styles/app_style.dart';
import 'package:tictactoe/common/styles/app_text_style.dart';

class ParkingButton extends StatelessWidget {
  final double? width;
  final double? height;
  final void Function()? onClick;
  final String text;
  final Color? bgColor;
  final TextStyle? textStyle;
  final Widget? prefixWidget;

  const ParkingButton(
      {super.key,
      this.width,
      this.height,
      this.onClick,
      this.bgColor,
      this.textStyle,
      this.prefixWidget,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? Get.width,
      height: height ?? AppStyle.buttonHeight.h,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(200)),
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor:
                MaterialStatePropertyAll(bgColor ?? AppStyle.primaryColor),
            shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32)))),
        onPressed: onClick ?? () {},
        child: prefixWidget != null
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  prefixWidget!,
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(
                    text,
                    style: textStyle ??
                        AppTextStyle.popBlackRegularTextStyle
                            .copyWith(color: Colors.white),
                  )
                ],
              )
            : Text(
                text,
                style: textStyle ??
                    AppTextStyle.popBlackRegularTextStyle
                        .copyWith(color: Colors.white),
              ),
      ),
    );
  }
}
