import 'package:json_annotation/json_annotation.dart';

part 'translation.g.dart';

@JsonSerializable()
class Translation {
  Translation({this.to, this.translated});

  factory Translation.fromJson(Map<String, dynamic> json) {
    return _$TranslationFromJson(json);
  }
  String? to;
  List<String>? translated;

  Map<String, dynamic> toJson() => _$TranslationToJson(this);
}
