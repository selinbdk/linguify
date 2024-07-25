import 'package:json_annotation/json_annotation.dart';

part 'translate_request_model.g.dart';

@JsonSerializable()
class TranslateRequestModel {
  TranslateRequestModel({this.from, this.texts, this.to});

  factory TranslateRequestModel.fromJson(Map<String, dynamic> json) {
    return _$TranslateRequestModelFromJson(json);
  }

  String? from;
  List<String>? texts;
  List<String>? to;

  Map<String, dynamic> toJson() => _$TranslateRequestModelToJson(this);
}
