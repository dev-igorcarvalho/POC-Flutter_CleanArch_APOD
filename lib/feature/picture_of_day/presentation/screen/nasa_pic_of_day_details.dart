import 'package:daily_astronomy/feature/picture_of_day/domain/entity/picture_of_day_entity.dart';
import 'package:flutter/material.dart';

import '../widget/picture_of_day_data.dart';
import '../widget/picture_of_day_image.dart';

class NasaPicOfDayDetailsScreen extends StatelessWidget {
  static const ROUTE_NAME = "/details";
  final PictureOfDayEntity entity;

  const NasaPicOfDayDetailsScreen({Key? key, required this.entity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          Expanded(
              child: PictureOfDayImage(
            url: entity.url,
          )),
          PictureOfDayData(
            entity: entity,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FloatingActionButton(
                backgroundColor: Colors.white,
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Icon(Icons.arrow_back)),
          )
        ]),
      ),
    );
  }
}
