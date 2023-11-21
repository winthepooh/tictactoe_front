import 'dart:convert';

import 'package:get_it/get_it.dart';
import 'package:tictactoe/domain/model/socketcmd/endmatch/cmd_end.dart';
import 'package:tictactoe/domain/model/socketcmd/handshake/cmd_handshake.dart';
import 'package:tictactoe/domain/model/socketcmd/joinroom/cmd_joinroom.dart';
import 'package:tictactoe/domain/model/socketcmd/move/cmd_move.dart';
import 'package:tictactoe/services/stores/tic_store.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class SocketCMD {
  Future<void> sendHandShake(WebSocketChannel socket) async {
    socket.sink.add(jsonEncode(
        CmdHandshake(user_id: GetIt.I<TicStore>().getUser().id!).toJson()));
  }

  Future<void> sendJoinRoom(WebSocketChannel socket, int id) async {
    socket.sink.add(jsonEncode(
        CmdJoinRoom(owner_id: id, joiner_id: GetIt.I<TicStore>().getUser().id!)
            .toJson()));
  }

  Future<void> sendMove(
      WebSocketChannel socket, int move_index, int move_weight, int id) async {
    socket.sink.add(jsonEncode(
        CmdMove(to_id: id, move_index: move_index, move_number: move_weight)
            .toJson()));
  }

  Future<void> sendEndMatch(
      WebSocketChannel socket, int winner_id, int to_id) async {
    socket.sink
        .add(jsonEncode(CmdEnd(to_id: to_id, winner_id: winner_id).toJson()));
  }
}
