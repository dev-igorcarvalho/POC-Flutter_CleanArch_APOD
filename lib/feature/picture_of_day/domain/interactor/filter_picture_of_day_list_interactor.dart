import 'package:daily_astronomy/feature/picture_of_day/domain/entity/picture_of_day_entity.dart';
import 'package:daily_astronomy/feature/picture_of_day/domain/repository/picture_of_day_local_repository.dart';

import '../../../../core/interactor/interactor.dart';

class FilterPictureOfDayListInteractor
    implements
        Interactor<SearchPictureOfDayInteractorInput,
            List<PictureOfDayEntity>> {
  final PictureOfDayLocalRepository cache;

  FilterPictureOfDayListInteractor(this.cache);

  @override
  List<PictureOfDayEntity> execute(SearchPictureOfDayInteractorInput input) {
    final List<PictureOfDayEntity> cached = cache.localStorage.values.toList();
    List<PictureOfDayEntity> result = cached;
    if (input.title != null) {
      result = result
          .where((element) => element.title.contains(input.title!))
          .toList();
    }
    if (input.date != null) {
      result = result.where((element) => element.date == input.date!).toList();
    }
    return result;
  }
}

class SearchPictureOfDayInteractorInput {
  final String? title;
  final DateTime? date;

  SearchPictureOfDayInteractorInput({
    this.title,
    this.date,
  });
}
