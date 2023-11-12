import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tictactoe/common/styles/app_style.dart';
import 'package:tictactoe/common/styles/app_text_style.dart';
import 'package:tictactoe/presentation/pages/page_selectmode/controller/selectmode_page_controller.dart';
import 'package:tictactoe/presentation/shared_components/parkingbutton.dart';

class SelectModePage extends GetView<SelectModePageController> {
  const SelectModePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 500.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "CHOOSE MODE",
                style: AppTextStyle.popBlackMediumTextStyle
                    .copyWith(fontSize: 60.sp),
              ),
              SizedBox(
                height: 30.h,
              ),
              ParkingButton(
                  height: 50.h,
                  text: "MULTIPLAYER",
                  textStyle: AppTextStyle.popBlackMediumTextStyle
                      .copyWith(fontSize: 30.sp, color: Colors.white),
                  onClick: () => controller.clickMultiPlayer()),
              SizedBox(
                height: 15.h,
              ),
              ParkingButton(
                height: 50.h,
                text: "SINGLE PLAYER",
                bgColor: AppStyle.grey3,
                textStyle: AppTextStyle.popBlackMediumTextStyle
                    .copyWith(fontSize: 30.sp, color: Colors.white),
                onClick: () => controller.clickSinglePlayer(),
              ),
              SizedBox(
                height: 60.h,
              ),
              ParkingButton(
                height: 50.h,
                text: "HISTORY",
                bgColor: AppStyle.grey2,
                textStyle: AppTextStyle.popBlackMediumTextStyle
                    .copyWith(fontSize: 30.sp, color: Colors.black),
                onClick: () => controller.clickHistory(),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
