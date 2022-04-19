import 'package:json_annotation/json_annotation.dart';

part 'model_data.g.dart';

@JsonSerializable()
class ModelData {
  ModelData(this.name, this.email);

  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'email')
  String email;

  factory ModelData.fromJson(Map<String, dynamic> json) =>
      _$ModelDataFromJson(json);

  Map<String, dynamic> toJson() => _$ModelDataToJson(this);
}
