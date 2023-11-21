// ignore_for_file: invalid_use_of_protected_member

import 'dart:convert';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:tictactoe/domain/model/match/match_model.dart';
import 'package:tictactoe/domain/model/socketcmd/endmatch/cmd_end.dart';
import 'package:tictactoe/domain/model/socketcmd/joinroom/cmd_joinroom.dart';
import 'package:tictactoe/domain/model/socketcmd/move/cmd_move.dart';
import 'package:tictactoe/domain/repositories/match/match_repository.dart';
import 'package:tictactoe/domain/repositories/user/user_repository.dart';
import 'package:tictactoe/presentation/routes/app_pages.dart';
import 'package:tictactoe/services/socket/socketcmd.dart';
import 'package:tictactoe/services/stores/tic_store.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class MultiplayerPageController extends GetxController {
  RxList<List<int>> moves = [
    [0, 0, 0],
    [0, 0, 0],
    [0, 0, 0]
  ].obs;

  RxBool myTurn = false.obs;
  RxInt moveTime = 0.obs;
  RxBool haveWinner = false.obs;
  RxInt moveWinner = 0.obs;
  RxBool ownRoom = false.obs;
  RxBool findMatch = false.obs;
  RxString roomId = "".obs;
  RxString enemyName = "".obs;
  RxInt enemyId = 0.obs;
  Rx<MatchModel> roomInfo = MatchModel().obs;
  RxInt myMoveWeight = 0.obs;

  late WebSocketChannel socket;

  @override
  void onInit() async {
    super.onInit();
    connectToSocket();
    await findRoom();
  }

  Future<void> findRoom() async {
    Map<String, dynamic> res = await GetIt.I<MatchRepository>()
        .findMatch(GetIt.I<TicStore>().getUser().id!);
    roomId.value = (res["room_id"].toString());
    roomInfo.value =
        (await GetIt.I<MatchRepository>().getMatchInfo(roomId.value))!;
    if (res["status"] == "make_own_room") {
      ownRoom.value = true;
    } else {
      ownRoom.value = false;
      GetIt.I<SocketCMD>().sendJoinRoom(socket, roomInfo.value.player_one_id!);
      enemyName.value = await GetIt.I<UserRepository>()
          .getName(roomInfo.value.player_one_id!);
      findMatch.value = true;
      myMoveWeight.value = 2;
      enemyId.value = roomInfo.value.player_one_id!;
    }
  }

  void connectToSocket() {
    socket = WebSocketChannel.connect(
      Uri.parse('ws://localhost:3000'),
    );
    GetIt.I<SocketCMD>().sendHandShake(socket);
    socket.stream.listen((message) {
      doMessage(jsonDecode(message));
    });
  }

  void doMessage(Map<String, dynamic> message) async {
    print(message);

    if (message["cmd"] == "join") {
      CmdJoinRoom cmd = CmdJoinRoom.fromJson(message);
      enemyName.value = await GetIt.I<UserRepository>().getName(cmd.joiner_id!);
      findMatch.value = true;
      myTurn.value = true;
      enemyId.value = cmd.joiner_id!;
      roomInfo.value =
          (await GetIt.I<MatchRepository>().getMatchInfo(roomId.value))!;
      myMoveWeight.value = 1;
    } else if (message["cmd"] == "move") {
      CmdMove cmd = CmdMove.fromJson(message);
      clickMove(cmd.move_index!, cmd.move_number!);
      myTurn.value = true;
      myTurn.refresh();
    } else if (message["cmd"] == "end") {
      CmdEnd cmd = CmdEnd.fromJson(message);
      if (cmd.winner_id! == enemyId.value) {
        EasyLoading.showInfo("YOU LOSS!");
      } else if (cmd.winner_id! == -1) {
        EasyLoading.showInfo("DRAW!");
      } else {
        EasyLoading.showInfo("YOU WIN!");
      }
      Get.offAllNamed(Paths.SELECTMODE);
    }
  }

  void playerMove(int index) async {
    if (myTurn.value == true && moveTime.value != 9) {
      clickMove(index, myMoveWeight.value);
      GetIt.I<SocketCMD>()
          .sendMove(socket, index, myMoveWeight.value, enemyId.value);
      myTurn.value = false;
      myTurn.refresh();
      checkWinner();
      if (moveTime.value == 9 && haveWinner.value == false) {
        EasyLoading.showInfo("DRAW!");
        await GetIt.I<MatchRepository>().setWinner(roomId.value, -1);
        GetIt.I<SocketCMD>().sendEndMatch(socket, -1, enemyId.value);
        Get.offAllNamed(Paths.SELECTMODE);
      }
      if (haveWinner.value) {
        await GetIt.I<MatchRepository>()
            .setWinner(roomId.value, GetIt.I<TicStore>().getUser().id!);
        GetIt.I<SocketCMD>().sendEndMatch(
            socket, GetIt.I<TicStore>().getUser().id!, enemyId.value);
        Get.offAllNamed(Paths.SELECTMODE);
      }
    }
  }

  void clickMove(int index, int moveWeight) async {
    moves.value[index ~/ 3][index % 3] = moveWeight;
    moves.refresh();
    moveTime.value++;
  }

  void checkWinner() {
    checkRowColumnWin();
    checkCrossWin();
  }

  void checkCrossWin() {
    if (moves.value[0][0] == moves.value[1][1] &&
        moves.value[1][1] == moves.value[2][2] &&
        moves.value[0][0] != 0) {
      if (moves.value[0][0] == myMoveWeight.value) {
        EasyLoading.showInfo("YOU WIN!");
      } else {
        EasyLoading.showInfo("YOU LOSS!");
      }
      moveWinner.value = moves.value[1][1];

      haveWinner.value = true;
    }
    if (moves.value[0][2] == moves.value[1][1] &&
        moves.value[1][1] == moves.value[2][0] &&
        moves.value[0][2] != 0) {
      if (moves.value[0][0] == myMoveWeight.value) {
        EasyLoading.showInfo("YOU WIN!");
      } else {
        EasyLoading.showInfo("YOU LOSS!");
      }
      moveWinner.value = moves.value[1][1];
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
        if (value_x == myMoveWeight.value) {
          EasyLoading.showInfo("YOU WIN!");
        } else if (value_x == 2) {
          EasyLoading.showInfo("YOU LOSS!");
        }
        moveWinner.value = value_x;
        haveWinner.value = true;
        break;
      }
      if (times_y == 3) {
        if (value_y == myMoveWeight.value) {
          EasyLoading.showInfo("YOU WIN");
        } else {
          EasyLoading.showInfo("YOU LOSS!");
        }
        moveWinner.value = value_y;
        haveWinner.value = true;
        break;
      }
    }
  }
}
