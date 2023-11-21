import 'package:json_annotation/json_annotation.dart';

part 'cmd_end.g.dart';

@JsonSerializable(explicitToJson: true)
class CmdEnd {
  String cmd = "end";
  int? winner_id;
  int? to_id;

  CmdEnd({this.winner_id, this.to_id});

  factory CmdEnd.fromJson(Map<String, dynamic> json) => _$CmdEndFromJson(json);
  Map<String, dynamic> toJson() => _$CmdEndToJson(this);
}
