import 'package:json_annotation/json_annotation.dart';

part 'translate_request_model.g.dart';

@JsonSerializable()
class TranslateRequestModel {
  String? from;
  List<String>? texts;
  List<String>? to;

  TranslateRequestModel({this.from, this.texts, this.to});

  factory TranslateRequestModel.fromJson(Map<String, dynamic> json) {
    return _$TranslateRequestModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TranslateRequestModelToJson(this);
}
