// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tictactoe/common/styles/app_text_style.dart';
import 'package:tictactoe/presentation/pages/page_history/controller/history_page_controller.dart';

class HistoryPage extends GetView<HistoryPageController> {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 200.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "HISTORY",
                style: AppTextStyle.popBlackMediumTextStyle
                    .copyWith(fontSize: 60.sp),
              ),
              Expanded(
                  child: Obx(
                () => GridView.count(
                  crossAxisCount: 3,
                  children: controller.items.value,
                ),
              ))
            ],
          ),
        ),
      )),
    );
  }
}
