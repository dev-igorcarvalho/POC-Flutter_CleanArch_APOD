import 'package:flutter/material.dart';

import '../../domain/entity/picture_of_day_entity.dart';

class PictureOfDayData extends StatelessWidget {
  final PictureOfDayEntity entity;

  const PictureOfDayData({Key? key, required this.entity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(children: [
        ListTile(
          title: Text(entity.title),
          subtitle: Text(entity.date.toIso8601String()),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(entity.explanation),
            ),
          ),
        ),
      ]),
    );
  }
}
