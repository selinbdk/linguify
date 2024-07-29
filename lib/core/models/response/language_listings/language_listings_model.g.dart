// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'language_listings_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LanguageListingsModel _$LanguageListingsModelFromJson(
        Map<String, dynamic> json) =>
    LanguageListingsModel(
      languages: (json['languages'] as List<dynamic>?)
          ?.map((e) => LanguageModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LanguageListingsModelToJson(
        LanguageListingsModel instance) =>
    <String, dynamic>{
      'languages': instance.languages,
    };
