import 'package:json_annotation/json_annotation.dart';

part 'detect_language_result_model.g.dart';

@JsonSerializable()
class DetectLanguageResultModel {
  DetectLanguageResultModel({
    this.detectedLanguages,
    this.originalCharacters,
  });

  factory DetectLanguageResultModel.fromJson(Map<String, dynamic> json) {
    return _$DetectLanguageResultModelFromJson(json);
  }
  @JsonKey(name: 'detected_languages')
  List<String>? detectedLanguages;
  @JsonKey(name: 'original_characters')
  int? originalCharacters;

  Map<String, dynamic> toJson() => _$DetectLanguageResultModelToJson(this);
}
