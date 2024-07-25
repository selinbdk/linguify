import 'package:json_annotation/json_annotation.dart';

import 'language_model.dart';

part 'language_listings_model.g.dart';

@JsonSerializable()
class LanguageListingsModel {
  LanguageListingsModel({this.languages});

  factory LanguageListingsModel.fromJson(Map<String, dynamic> json) => _$LanguageListingsModelFromJson(json);
  List<LanguageModel>? languages;

  Map<String, dynamic> toJson() => _$LanguageListingsModelToJson(this);
}
