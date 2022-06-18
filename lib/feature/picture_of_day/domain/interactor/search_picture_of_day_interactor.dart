import 'package:daily_astronomy/feature/picture_of_day/domain/entity/picture_of_day_entity.dart';

import '../../../../core/interactor/interactor.dart';

class SearchPictureOfDayInteractor
    implements
        Interactor<SearchPictureOfDayInteractorInput, PictureOfDayEntity> {
  @override
  PictureOfDayEntity execute(SearchPictureOfDayInteractorInput input) {
    throw UnimplementedError();
  }
}

class SearchPictureOfDayInteractorInput {
  final List<PictureOfDayEntity> source;
  final String? title;
  final DateTime? date;

  SearchPictureOfDayInteractorInput(
      {this.title, this.date, required this.source});
}
