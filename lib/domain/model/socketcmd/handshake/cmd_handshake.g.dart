// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cmd_handshake.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CmdHandshake _$CmdHandshakeFromJson(Map<String, dynamic> json) => CmdHandshake(
      user_id: json['user_id'] as int?,
    )..cmd = json['cmd'] as String;

Map<String, dynamic> _$CmdHandshakeToJson(CmdHandshake instance) =>
    <String, dynamic>{
      'cmd': instance.cmd,
      'user_id': instance.user_id,
    };
