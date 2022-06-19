import '../entity/picture_of_day_entity.dart';

///Interface to specify the use of PictureOfDayRepository
abstract class PictureOfDayRepository {
  Future<List<PictureOfDayEntity>> fetchPicturesFromDateRange(
      {required DateTime startDate, DateTime? endDate});
}
