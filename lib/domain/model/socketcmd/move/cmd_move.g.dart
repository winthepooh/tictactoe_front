// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cmd_move.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CmdMove _$CmdMoveFromJson(Map<String, dynamic> json) => CmdMove(
      to_id: json['to_id'] as int?,
      move_index: json['move_index'] as int?,
      move_number: json['move_number'] as int?,
    )..cmd = json['cmd'] as String;

Map<String, dynamic> _$CmdMoveToJson(CmdMove instance) => <String, dynamic>{
      'cmd': instance.cmd,
      'to_id': instance.to_id,
      'move_index': instance.move_index,
      'move_number': instance.move_number,
    };
