// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cmd_joinroom.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CmdJoinRoom _$CmdJoinRoomFromJson(Map<String, dynamic> json) => CmdJoinRoom(
      owner_id: json['owner_id'] as int?,
      joiner_id: json['joiner_id'] as int?,
    )..cmd = json['cmd'] as String;

Map<String, dynamic> _$CmdJoinRoomToJson(CmdJoinRoom instance) =>
    <String, dynamic>{
      'cmd': instance.cmd,
      'owner_id': instance.owner_id,
      'joiner_id': instance.joiner_id,
    };
