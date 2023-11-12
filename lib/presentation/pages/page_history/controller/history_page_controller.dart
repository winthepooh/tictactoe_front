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
      SizedBox(
        height: 40.h,
        child: Text(
          "NO",
          style: AppTextStyle.popBlackMediumTextStyle.copyWith(fontSize: 40.sp),
        ),
      ),
      SizedBox(
        height: 40.h,
        child: Text(
          "VS",
          style: AppTextStyle.popBlackMediumTextStyle.copyWith(fontSize: 40.sp),
        ),
      ),
      SizedBox(
        height: 40.h,
        child: Text(
          "RESULTS",
          style: AppTextStyle.popBlackMediumTextStyle.copyWith(fontSize: 40.sp),
        ),
      ),
    ];
    putHistoryInList();
  }

  void putHistoryInList() async {
    int index = 1;
    int myId = GetIt.I<TicStore>().getUser().id!;
    for (MatchModel i in matchList.value) {
      items.value.add(SizedBox(
        height: 40.h,
        child: Text(
          index.toString(),
          style:
              AppTextStyle.popBlackRegularTextStyle.copyWith(fontSize: 30.sp),
        ),
      ));
      items.value.add(SizedBox(
        height: 40.h,
        child: Text(
            await GetIt.I<UserRepository>().getName(
                i.player_two_id! != myId ? i.player_two_id! : i.player_one_id!),
            style: AppTextStyle.popBlackRegularTextStyle
                .copyWith(fontSize: 30.sp)),
      ));
      items.value.add(SizedBox(
        height: 40.h,
        child: Text(myId == i.player_win_id! ? "WIN" : "LOSS",
            style: AppTextStyle.popBlackRegularTextStyle
                .copyWith(fontSize: 30.sp)),
      ));
      index++;
    }
  }
}
