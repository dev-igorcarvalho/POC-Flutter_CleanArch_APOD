import 'package:daily_astronomy/feature/picture_of_day/presentation/widget/picture_of_day_list_item.dart';
import 'package:flutter/material.dart';

import '../../domain/entity/picture_of_day_entity.dart';

class PictureOfDayList extends StatelessWidget {
  final List<PictureOfDayEntity> pictures;

  const PictureOfDayList({Key? key, required this.pictures}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      key: Key('apod_list'),
      children: pictures
          .map((e) => PictureOfDayListItem(
                entity: e,
              ))
          .toList(),
    );
  }
}
