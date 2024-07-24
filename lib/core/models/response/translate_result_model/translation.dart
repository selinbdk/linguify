import 'package:json_annotation/json_annotation.dart';

part 'translation.g.dart';

@JsonSerializable()
class Translation {
  String? to;
  List<String>? translated;

  Translation({this.to, this.translated});

  factory Translation.fromJson(Map<String, dynamic> json) {
    return _$TranslationFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TranslationToJson(this);
  
}
