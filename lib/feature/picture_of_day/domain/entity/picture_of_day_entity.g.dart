// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'picture_of_day_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PictureOfDayEntityAdapter extends TypeAdapter<PictureOfDayEntity> {
  @override
  final int typeId = 1;

  @override
  PictureOfDayEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PictureOfDayEntity(
      fields[0] as DateTime,
      fields[2] as String,
      fields[3] as String,
      fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, PictureOfDayEntity obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.date)
      ..writeByte(2)
      ..write(obj.explanation)
      ..writeByte(3)
      ..write(obj.title)
      ..writeByte(4)
      ..write(obj.url);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PictureOfDayEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

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
