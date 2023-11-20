import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tictactoe/common/styles/app_text_style.dart';

class PlayTurn extends StatelessWidget {
  final bool isMyTurn;
  const PlayTurn({super.key, required this.isMyTurn});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      width: 250.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.r),
          color: isMyTurn ? Colors.green : Colors.red),
      child: Center(
          child: Text(
        isMyTurn ? "YOUR TURN" : "ENEMY TURN",
        style: AppTextStyle.popBlackSemiBoldTextStyle
            .copyWith(fontSize: 30.sp, color: Colors.white),
      )),
    );
  }
}
