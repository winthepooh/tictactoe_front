import 'package:json_annotation/json_annotation.dart';

part 'cmd_move.g.dart';

@JsonSerializable(explicitToJson: true)
class CmdMove {
  String cmd = "move";
  int? to_id;
  int? move_index;
  int? move_number;

  CmdMove({this.to_id, this.move_index, this.move_number});

  factory CmdMove.fromJson(Map<String, dynamic> json) =>
      _$CmdMoveFromJson(json);
  Map<String, dynamic> toJson() => _$CmdMoveToJson(this);
}
