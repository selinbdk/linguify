// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'translate_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TranslateRequestModel _$TranslateRequestModelFromJson(
        Map<String, dynamic> json) =>
    TranslateRequestModel(
      from: json['from'] as String?,
      texts:
          (json['texts'] as List<dynamic>?)?.map((e) => e as String).toList(),
      to: (json['to'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$TranslateRequestModelToJson(
        TranslateRequestModel instance) =>
    <String, dynamic>{
      'from': instance.from,
      'texts': instance.texts,
      'to': instance.to,
    };
