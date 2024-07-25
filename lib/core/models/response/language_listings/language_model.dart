import 'package:json_annotation/json_annotation.dart';

part 'language_model.g.dart';

@JsonSerializable()
class LanguageModel {
  LanguageModel({
    this.displayName,
    this.languageCode,
    this.supportSource,
    this.supportTarget,
  });

  factory LanguageModel.fromJson(Map<String, dynamic> json) {
    return _$LanguageModelFromJson(json);
  }
  @JsonKey(name: 'display_name')
  String? displayName;
  @JsonKey(name: 'language_code')
  String? languageCode;
  @JsonKey(name: 'support_source')
  bool? supportSource;
  @JsonKey(name: 'support_target')
  bool? supportTarget;

  Map<String, dynamic> toJson() => _$LanguageModelToJson(this);
}
