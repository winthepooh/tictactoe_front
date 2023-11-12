// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MatchModel _$MatchModelFromJson(Map<String, dynamic> json) => MatchModel(
      id: json['id'] as int?,
      is_waiting: json['is_waiting'] as int?,
      player_one_id: json['player_one_id'] as int?,
      player_two_id: json['player_two_id'] as int?,
      player_win_id: json['player_win_id'] as int?,
    );

Map<String, dynamic> _$MatchModelToJson(MatchModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'player_one_id': instance.player_one_id,
      'player_two_id': instance.player_two_id,
      'is_waiting': instance.is_waiting,
      'player_win_id': instance.player_win_id,
    };
