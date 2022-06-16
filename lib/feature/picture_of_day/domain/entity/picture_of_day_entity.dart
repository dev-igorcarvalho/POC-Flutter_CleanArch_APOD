import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'picture_of_day_entity.g.dart';

@JsonSerializable()
@HiveType(typeId: 1)
class PictureOfDayEntity extends HiveObject {
  @HiveField(0)
  final DateTime date;
  @HiveField(2)
  final String explanation;
  @HiveField(3)
  final String title;
  @HiveField(4)
  final String url;

  factory PictureOfDayEntity.fromJson(Map<String, dynamic> json) =>
      _$PictureOfDayEntityFromJson(json);

  PictureOfDayEntity(this.date, this.explanation, this.title, this.url);

  Map<String, dynamic> toJson() => _$PictureOfDayEntityToJson(this);

  @override
  String toString() {
    return 'PictureOfDayEntity{title: $title, url: $url}';
  }
}
