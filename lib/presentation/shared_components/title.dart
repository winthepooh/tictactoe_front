import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tictactoe/common/styles/app_text_style.dart';

class PlayTitle extends StatelessWidget {
  final String? title;
  const PlayTitle({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      width: 300.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.r), color: Colors.black),
      child: Center(
          child: Text(
        title ?? "PLAY VS AI",
        style: AppTextStyle.popBlackSemiBoldTextStyle
            .copyWith(fontSize: 30.sp, color: Colors.white),
      )),
    );
  }
}
