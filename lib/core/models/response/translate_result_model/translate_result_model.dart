import 'package:json_annotation/json_annotation.dart';

import 'translation.dart';

part 'translate_result_model.g.dart';

@JsonSerializable()
class TranslateResultModel {
  String? from;
  @JsonKey(name: 'translated_characters')
  int? translatedCharacters;
  List<Translation>? translations;

  TranslateResultModel({
    this.from,
    this.translatedCharacters,
    this.translations,
  });

  factory TranslateResultModel.fromJson(Map<String, dynamic> json) {
    return _$TranslateResultModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TranslateResultModelToJson(this);
}
