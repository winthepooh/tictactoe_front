// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:tictactoe/common/styles/app_text_style.dart';
import 'package:tictactoe/domain/model/match/match_model.dart';
import 'package:tictactoe/domain/repositories/match/match_repository.dart';
import 'package:tictactoe/domain/repositories/user/user_repository.dart';
import 'package:tictactoe/services/stores/tic_store.dart';

class HistoryPageController extends GetxController {
  RxList<MatchModel> matchList = <MatchModel>[].obs;
  RxList<Widget> items = <Widget>[].obs;

  @override
  void onInit() async {
    super.onInit();
    matchList.value = (await GetIt.I<MatchRepository>().getHistory())!;
    items.value = [
      Row(
        children: [
          Text(
            "NO",
            style:
                AppTextStyle.popBlackMediumTextStyle.copyWith(fontSize: 40.sp),
          ),
          const Spacer(),
          Text(
            "VS",
            style:
                AppTextStyle.popBlackMediumTextStyle.copyWith(fontSize: 40.sp),
          ),
          const Spacer(),
          Text(
            "RESULTS",
            style:
                AppTextStyle.popBlackMediumTextStyle.copyWith(fontSize: 40.sp),
          ),
        ],
      )
    ];
    putHistoryInList();
  }

  void putHistoryInList() async {
    int index = 1;
    int myId = GetIt.I<TicStore>().getUser().id!;
    for (MatchModel i in matchList.value) {
      items.value.add(Row(
        children: [
          Text(
            index.toString(),
            style:
                AppTextStyle.popBlackRegularTextStyle.copyWith(fontSize: 30.sp),
          ),
          const Spacer(),
          Text(
              await GetIt.I<UserRepository>().getName(i.player_two_id! != myId
                  ? i.player_two_id!
                  : i.player_one_id!),
              style: AppTextStyle.popBlackRegularTextStyle
                  .copyWith(fontSize: 30.sp)),
          const Spacer(),
          Text(myId == i.player_win_id! ? "WIN" : "LOSS",
              style: AppTextStyle.popBlackRegularTextStyle
                  .copyWith(fontSize: 30.sp))
        ],
      ));
      index++;
      items.refresh();
      matchList.refresh();
    }
  }
}
