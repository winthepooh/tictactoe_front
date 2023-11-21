// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cmd_end.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CmdEnd _$CmdEndFromJson(Map<String, dynamic> json) => CmdEnd(
      winner_id: json['winner_id'] as int?,
      to_id: json['to_id'] as int?,
    )..cmd = json['cmd'] as String;

Map<String, dynamic> _$CmdEndToJson(CmdEnd instance) => <String, dynamic>{
      'cmd': instance.cmd,
      'winner_id': instance.winner_id,
      'to_id': instance.to_id,
    };
