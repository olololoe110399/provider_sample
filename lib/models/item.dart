import 'package:json_annotation/json_annotation.dart';

part 'item.g.dart';

@JsonSerializable()
class Item {
  Item({
    this.id,
    required this.title,
    required this.description,
    this.createAt,
  });

  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'title')
  String title;
  @JsonKey(name: 'description')
  String description;
  @JsonKey(name: 'create_at')
  String? createAt;

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);

  Map<String, dynamic> toJson() => _$ItemToJson(this);

  Item copyWith({
    int? id,
    String? title,
    String? description,
    String? createAt,
  }) {
    return Item(
    id: id ?? this.id,
     title: title ?? this.title,
    description:  description ?? this.description,
     createAt: createAt ?? this.createAt,
    );
  }
}
