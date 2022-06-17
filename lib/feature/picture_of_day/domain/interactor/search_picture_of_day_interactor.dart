import 'package:daily_astronomy/feature/picture_of_day/domain/entity/picture_of_day_entity.dart';

import '../../../../core/interactor/interactor.dart';

class SearchPictureOfDayInteractor
    implements Interactor<InputModel, PictureOfDayEntity> {
  @override
  PictureOfDayEntity execute(InputModel input) {
    throw UnimplementedError();
  }
}

class InputModel {
  final List<PictureOfDayEntity> source;
  final String? title;
  final DateTime? date;

  InputModel({this.title, this.date, required this.source});
}
