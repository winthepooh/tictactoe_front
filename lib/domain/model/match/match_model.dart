import 'package:json_annotation/json_annotation.dart';

part 'match_model.g.dart';

@JsonSerializable(explicitToJson: true)
class MatchModel {
  int? id;
  int? player_one_id;
  int? player_two_id;
  int? is_waiting;
  int? player_win_id;

  MatchModel(
      {this.id,
      this.is_waiting,
      this.player_one_id,
      this.player_two_id,
      this.player_win_id});

  factory MatchModel.fromJson(Map<String, dynamic> json) =>
      _$MatchModelFromJson(json);
  Map<String, dynamic> toJson() => _$MatchModelToJson(this);
}
