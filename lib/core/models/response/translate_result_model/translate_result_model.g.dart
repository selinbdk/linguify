// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'translate_result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TranslateResultModel _$TranslateResultModelFromJson(
        Map<String, dynamic> json) =>
    TranslateResultModel(
      from: json['from'] as String?,
      translatedCharacters: (json['translated_characters'] as num?)?.toInt(),
      translations: (json['translations'] as List<dynamic>?)
          ?.map((e) => Translation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TranslateResultModelToJson(
        TranslateResultModel instance) =>
    <String, dynamic>{
      'from': instance.from,
      'translated_characters': instance.translatedCharacters,
      'translations': instance.translations,
    };
