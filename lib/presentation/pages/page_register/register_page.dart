import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tictactoe/common/styles/app_style.dart';
import 'package:tictactoe/common/styles/app_text_style.dart';
import 'package:tictactoe/presentation/pages/page_register/controller/register_page_controller.dart';
import 'package:tictactoe/presentation/shared_components/parking_textfield.dart';
import 'package:tictactoe/presentation/shared_components/parkingbutton.dart';

class RegisterPage extends GetView<RegisterPageController> {
  const RegisterPage({super.key});

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
                "REGISTRATION",
                style: AppTextStyle.popBlackMediumTextStyle
                    .copyWith(fontSize: 60.sp),
              ),
              SizedBox(
                height: 15.h,
              ),
              ParkingTextField(
                controller: controller.usernameTextField,
                hintText: "Username",
              ),
              SizedBox(
                height: 15.h,
              ),
              ParkingTextField(
                controller: controller.passwordTextField,
                hintText: "Password",
                isPassword: true,
              ),
              SizedBox(
                height: 15.h,
              ),
              ParkingTextField(
                controller: controller.confirmPasswordTextField,
                hintText: "Confirm Password",
                isPassword: true,
              ),
              SizedBox(
                height: 40.h,
              ),
              ParkingButton(
                  height: 50.h,
                  text: "REGISTER",
                  textStyle: AppTextStyle.popBlackMediumTextStyle
                      .copyWith(fontSize: 30.sp, color: Colors.white),
                  onClick: () => controller.clickRegister()),
              SizedBox(
                height: 15.h,
              ),
              ParkingButton(
                height: 50.h,
                text: "BACK",
                bgColor: AppStyle.grey3,
                textStyle: AppTextStyle.popBlackMediumTextStyle
                    .copyWith(fontSize: 30.sp, color: Colors.white),
                onClick: () => controller.clickBack(),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
