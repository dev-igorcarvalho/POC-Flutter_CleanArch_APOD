import 'package:daily_astronomy/feature/picture_of_day/domain/entity/picture_of_day_entity.dart';
import 'package:flutter/material.dart';

import '../screen/nasa_pic_of_day_details.dart';

class PictureOfDayListItem extends StatelessWidget {
  final PictureOfDayEntity entity;

  const PictureOfDayListItem({Key? key, required this.entity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: ListTile(
        key: Key('apod_list_item'),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => NasaPicOfDayDetailsScreen(
                      entity: entity,
                    )),
          );
        },
        title: Text(entity.title),
        subtitle: Text(
          entity.date.toIso8601String(),
          style: TextStyle(color: Colors.black.withOpacity(0.6)),
        ),
      ),
    );
  }
}
