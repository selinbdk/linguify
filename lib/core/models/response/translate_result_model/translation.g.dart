// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'translation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Translation _$TranslationFromJson(Map<String, dynamic> json) => Translation(
      to: json['to'] as String?,
      translated: (json['translated'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$TranslationToJson(Translation instance) =>
    <String, dynamic>{
      'to': instance.to,
      'translated': instance.translated,
    };
