// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tictactoe/presentation/shared_components/playboard.dart';
import 'package:tictactoe/presentation/shared_components/title.dart';
import 'package:tictactoe/presentation/pages/page_playai/controller/playai_page_controller.dart';
import 'package:tictactoe/presentation/shared_components/turn.dart';

class PlayAiPlage extends GetView<PlayAiPageController> {
  const PlayAiPlage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 20.h,
            ),
            const PlayTitle(),
            SizedBox(
              height: 15.h,
            ),
            Obx(() => PlayTurn(isMyTurn: controller.myTurn.value)),
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
      )),
    );
  }
}
