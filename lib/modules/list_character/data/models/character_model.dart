import 'package:json_annotation/json_annotation.dart';
part 'character_model.g.dart';

@JsonSerializable()
class CharacterModel {
  final String name;
  final String status;
  final String gender;

  CharacterModel({
    this.name,
    this.status,
    this.gender,
  });

  factory CharacterModel.fromJson(Map<String, dynamic> json) =>
      _$CharacterModelFromJson(json);

  Map<String, dynamic> toJson() => _$CharacterModelToJson(this);

  static List<CharacterModel> fromJsonList(List<dynamic> json) =>
      json?.map((i) => CharacterModel.fromJson(i))?.toList() ?? [];

}
