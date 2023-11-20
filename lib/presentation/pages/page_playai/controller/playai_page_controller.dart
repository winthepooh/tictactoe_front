// ignore_for_file: invalid_use_of_protected_member

import 'dart:math';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:tictactoe/domain/repositories/match/match_repository.dart';
import 'package:tictactoe/presentation/routes/app_pages.dart';
import 'package:tictactoe/services/stores/tic_store.dart';

class PlayAiPageController extends GetxController {
  RxList<List<int>> moves = [
    [0, 0, 0],
    [0, 0, 0],
    [0, 0, 0]
  ].obs;

  RxBool myTurn = false.obs;
  RxInt moveTime = 0.obs;
  RxBool haveWinner = false.obs;
  RxInt moveWinner = 0.obs;

  @override
  void onInit() {
    super.onInit();
    myTurn.value = Random().nextInt(2) == 0 ? false : true;
    myTurn.refresh();
    aiMove();
  }

  void aiMove() {
    if (myTurn.value == false) {
      while (true && moveTime.value != 9 && haveWinner.value != true) {
        int index = Random().nextInt(9);
        if (moves.value[index ~/ 3][index % 3] != 0) continue;
        clickMove(index);
        break;
      }
    }
  }

  void playerMove(int index) {
    if (myTurn.value == true && moveTime.value != 9) {
      clickMove(index);
      aiMove();
    }
  }

  void clickMove(int index) async {
    if (myTurn.value) {
      moves.value[index ~/ 3][index % 3] = 1;
    } else {
      moves.value[index ~/ 3][index % 3] = 2;
    }
    myTurn.value = !myTurn.value;
    moves.refresh();
    myTurn.refresh();
    moveTime.value++;
    checkWinner();
    if (moveTime.value == 9 && haveWinner.value == false) {
      EasyLoading.showInfo("DRAW!");
      await GetIt.I<MatchRepository>().playWithAI(-1);
      Get.offAllNamed(Paths.SELECTMODE);
    }
    if (haveWinner.value) {
      await GetIt.I<MatchRepository>().playWithAI(
          moveWinner.value == 1 ? GetIt.I<TicStore>().getUser().id! : 1);
      Get.offAllNamed(Paths.SELECTMODE);
    }
  }

  void checkWinner() {
    checkRowColumnWin();
    checkCrossWin();
  }

  void checkCrossWin() {
    if (moves.value[0][0] == moves.value[1][1] &&
        moves.value[1][1] == moves.value[2][2] &&
        moves.value[0][0] != 0) {
      if (moves.value[0][0] == 1) {
        EasyLoading.showInfo("YOU WIN!");
        moveWinner.value = 1;
      } else if (moves.value[0][0] == 2) {
        EasyLoading.showInfo("YOU LOSS!");
        moveWinner.value = 2;
      }

      haveWinner.value = true;
    }
    if (moves.value[0][2] == moves.value[1][1] &&
        moves.value[1][1] == moves.value[2][0] &&
        moves.value[0][2] != 0) {
      if (moves.value[0][0] == 1) {
        EasyLoading.showInfo("YOU WIN!");
        moveWinner.value = 1;
      } else if (moves.value[0][0] == 2) {
        EasyLoading.showInfo("YOU LOSS!");
        moveWinner.value = 2;
      }
      haveWinner.value = true;
    }
  }

  void checkRowColumnWin() {
    for (int i = 0; i < 3; i++) {
      int times_x = 0;
      int times_y = 0;
      int value_x = 0;
      int value_y = 0;
      for (int y = 0; y < 3; y++) {
        if (moves.value[i][y] != 0) {
          if (value_x == moves.value[i][y]) {
            times_x++;
          } else {
            value_x = moves.value[i][y];
            times_x = 1;
          }
        }
        if (moves.value[y][i] != 0) {
          if (value_y == moves.value[y][i]) {
            times_y++;
          } else {
            value_y = moves.value[y][i];
            times_y = 1;
          }
        }
      }
      if (times_x == 3) {
        if (value_x == 1) {
          EasyLoading.showInfo("YOU WIN!");
          moveWinner.value = 1;
        } else if (value_x == 2) {
          EasyLoading.showInfo("YOU LOSS!");
          moveWinner.value = 2;
        }
        haveWinner.value = true;
        break;
      }
      if (times_y == 3) {
        if (value_y == 1) {
          EasyLoading.showInfo("YOU WIN");
          moveWinner.value = 1;
        } else if (value_y == 2) {
          EasyLoading.showInfo("YOU LOSS!");
          moveWinner.value = 2;
        }
        haveWinner.value = true;
        break;
      }
    }
  }
}
