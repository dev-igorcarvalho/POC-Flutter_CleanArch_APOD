import '../entity/picture_of_day_entity.dart';

abstract class PictureOfDayRepository {
  Future<List<PictureOfDayEntity>> fetchPicturesFromDateRange(
      {required DateTime startDate, DateTime? endDate});
}
