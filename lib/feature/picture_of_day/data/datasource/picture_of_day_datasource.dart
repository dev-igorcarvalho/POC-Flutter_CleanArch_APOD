import '../../domain/entity/picture_of_day_entity.dart';

abstract class PictureOfDayDataSource {
  Future<List<PictureOfDayEntity>> fetchPicturesFromDateRange(
      {required DateTime startDate, DateTime? endDate});
}
