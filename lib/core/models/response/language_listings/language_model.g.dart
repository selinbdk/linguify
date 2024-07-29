// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'language_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LanguageModel _$LanguageModelFromJson(Map<String, dynamic> json) =>
    LanguageModel(
      displayName: json['display_name'] as String?,
      languageCode: json['language_code'] as String?,
      supportSource: json['support_source'] as bool?,
      supportTarget: json['support_target'] as bool?,
    );

Map<String, dynamic> _$LanguageModelToJson(LanguageModel instance) =>
    <String, dynamic>{
      'display_name': instance.displayName,
      'language_code': instance.languageCode,
      'support_source': instance.supportSource,
      'support_target': instance.supportTarget,
    };
