import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tictactoe/common/styles/app_text_style.dart';
import 'package:tictactoe/presentation/routes/app_pages.dart';
import 'package:tictactoe/presentation/shared_components/parkingbutton.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  void clickPlay() {
    Get.toNamed(Paths.LOGIN);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 30.h,
            ),
            Text(
              "T I C",
              style: AppTextStyle.popBlackExtraBoldTextStyle
                  .copyWith(fontSize: 70.sp),
            ),
            Text(
              "T A C",
              style: AppTextStyle.popBlackExtraBoldTextStyle
                  .copyWith(fontSize: 70.sp),
            ),
            Text(
              "T O E",
              style: AppTextStyle.popBlackExtraBoldTextStyle
                  .copyWith(fontSize: 70.sp),
            ),
            SizedBox(
              height: 30.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 500.w),
              child: ParkingButton(
                height: 80.h,
                text: "PLAY",
                textStyle: AppTextStyle.popBlackMediumTextStyle
                    .copyWith(fontSize: 50.sp, color: Colors.white),
                onClick: () => clickPlay(),
              ),
            )
          ],
        ),
      )),
    );
  }
}
