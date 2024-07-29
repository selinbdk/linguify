// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detect_language_result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetectLanguageResultModel _$DetectLanguageResultModelFromJson(
        Map<String, dynamic> json) =>
    DetectLanguageResultModel(
      detectedLanguages: (json['detected_languages'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      originalCharacters: (json['original_characters'] as num?)?.toInt(),
    );

Map<String, dynamic> _$DetectLanguageResultModelToJson(
        DetectLanguageResultModel instance) =>
    <String, dynamic>{
      'detected_languages': instance.detectedLanguages,
      'original_characters': instance.originalCharacters,
    };
