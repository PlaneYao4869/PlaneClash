// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../whitelist.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Whitelist _$WhitelistFromJson(Map<String, dynamic> json) => _Whitelist(
  id: (json['id'] as num?)?.toInt() ?? -1,
  domain: json['domain'] as String,
  enabled: json['enabled'] as bool? ?? false,
  description: json['description'] as String?,
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$WhitelistToJson(_Whitelist instance) =>
    <String, dynamic>{
      'id': instance.id,
      'domain': instance.domain,
      'enabled': instance.enabled,
      'description': instance.description,
      'createdAt': instance.createdAt?.toIso8601String(),
    };
