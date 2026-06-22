// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../process_whitelist.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProcessWhitelist _$ProcessWhitelistFromJson(Map<String, dynamic> json) =>
    _ProcessWhitelist(
      id: (json['id'] as num?)?.toInt() ?? -1,
      processName: json['processName'] as String,
      exePath: json['exePath'] as String,
      enabled: json['enabled'] as bool? ?? true,
      description: json['description'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$ProcessWhitelistToJson(_ProcessWhitelist instance) =>
    <String, dynamic>{
      'id': instance.id,
      'processName': instance.processName,
      'exePath': instance.exePath,
      'enabled': instance.enabled,
      'description': instance.description,
      'createdAt': instance.createdAt?.toIso8601String(),
    };
