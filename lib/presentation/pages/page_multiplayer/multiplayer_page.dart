// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tictactoe/common/styles/app_text_style.dart';
import 'package:tictactoe/presentation/pages/page_multiplayer/controller/multiplayer_page_controller.dart';
import 'package:tictactoe/presentation/shared_components/playboard.dart';
import 'package:tictactoe/presentation/shared_components/title.dart';
import 'package:tictactoe/presentation/shared_components/turn.dart';

class MultiPlayerPage extends GetView<MultiplayerPageController> {
  const MultiPlayerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Stack(
          children: [
            Obx(() => controller.findMatch.value
                ? Container()
                : Container(
                    height: Get.height,
                    width: Get.width,
                    decoration:
                        BoxDecoration(color: Colors.black.withOpacity(0.3)),
                    child: Center(
                      child: Text(
                        "PLEASE WAIT...FIND MATCH",
                        style: AppTextStyle.popBlackSemiBoldTextStyle
                            .copyWith(fontSize: 100.sp, color: Colors.white),
                      ),
                    ),
                  )),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20.h,
                ),
                Obx(() => PlayTitle(
                      title: "PLAY VS ${controller.enemyName.value}",
                    )),
                SizedBox(
                  height: 15.h,
                ),
                Obx(() => PlayTurn(
                      isMyTurn: controller.myTurn.value,
                      name: controller.enemyName.value,
                    )),
                SizedBox(
                  height: 15.h,
                ),
                Obx(() => PlayBoard(
                      moves: controller.moves.value,
                      clickBoard: (index) {
                        controller.playerMove(index);
                      },
                    ))
              ],
            ),
          ],
        ),
      )),
    );
  }
}
