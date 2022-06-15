import 'package:daily_astronomy/core/interactor/future_interactor.dart';
import 'package:daily_astronomy/feature/picture_of_day/domain/entity/picture_of_day_entity.dart';
import 'package:daily_astronomy/feature/picture_of_day/domain/repository/picture_of_day_repository.dart';

class FecthPictureOfDayListInteractor
    implements FutureInteractor<InputModel, List<PictureOfDayEntity>> {
  final PictureOfDayRepository _repository;

  FecthPictureOfDayListInteractor(this._repository);

  @override
  Future<List<PictureOfDayEntity>> execute(InputModel input) async {
    return await _repository.fetchPicturesFromDateRange(
        startDate: input.startDate, endDate: input.endDate);
  }
}

class InputModel {
  final DateTime startDate;
  final DateTime endDate;

  InputModel(this.startDate, this.endDate);
}
