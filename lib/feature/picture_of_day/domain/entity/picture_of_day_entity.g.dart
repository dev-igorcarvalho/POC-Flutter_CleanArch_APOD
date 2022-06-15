// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'picture_of_day_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PictureOfDayEntity _$PictureOfDayEntityFromJson(Map<String, dynamic> json) =>
    PictureOfDayEntity(
      DateTime.parse(json['date'] as String),
      json['explanation'] as String,
      json['title'] as String,
      json['url'] as String,
    );

Map<String, dynamic> _$PictureOfDayEntityToJson(PictureOfDayEntity instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'explanation': instance.explanation,
      'title': instance.title,
      'url': instance.url,
    };
