import 'package:json_annotation/json_annotation.dart';

part 'picture_of_day_entity.g.dart';

@JsonSerializable()
class PictureOfDayEntity {
  final DateTime date;
  final String explanation;
  final String title;
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
