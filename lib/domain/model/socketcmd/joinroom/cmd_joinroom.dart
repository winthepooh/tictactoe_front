import 'package:json_annotation/json_annotation.dart';

part 'cmd_joinroom.g.dart';

@JsonSerializable(explicitToJson: true)
class CmdJoinRoom {
  String cmd = "join";
  int? owner_id;
  int? joiner_id;

  CmdJoinRoom({this.owner_id, this.joiner_id});

  factory CmdJoinRoom.fromJson(Map<String, dynamic> json) =>
      _$CmdJoinRoomFromJson(json);
  Map<String, dynamic> toJson() => _$CmdJoinRoomToJson(this);
}
