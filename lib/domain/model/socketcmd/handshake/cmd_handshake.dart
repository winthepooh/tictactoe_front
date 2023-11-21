import 'package:json_annotation/json_annotation.dart';

part 'cmd_handshake.g.dart';

@JsonSerializable(explicitToJson: true)
class CmdHandshake {
  String cmd = "handshake";
  int? user_id;

  CmdHandshake({this.user_id});

  factory CmdHandshake.fromJson(Map<String, dynamic> json) =>
      _$CmdHandshakeFromJson(json);
  Map<String, dynamic> toJson() => _$CmdHandshakeToJson(this);
}
