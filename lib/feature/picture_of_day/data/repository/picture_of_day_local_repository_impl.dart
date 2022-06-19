import 'package:daily_astronomy/feature/picture_of_day/domain/repository/picture_of_day_local_repository.dart';

import '../../domain/entity/picture_of_day_entity.dart';

class PictureOfDayLocalRepositoryImpl extends PictureOfDayLocalRepository {
  PictureOfDayLocalRepositoryImpl(super.localStorage);

  ///Fetch all elements of the specified local storage in data range
  @override
  Future<List<PictureOfDayEntity>> fetchPicturesFromDateRange(
      {required DateTime startDate, DateTime? endDate}) async {
    return localStorage.values.toList();
  }

  ///Persist at local storage a List<PictureOfDayEntity>
  @override
  Future<bool> cachePicturesOfDay(
      {required List<PictureOfDayEntity> pictures}) async {
    await localStorage.clear();
    Iterable<int> addAll = await localStorage.addAll(pictures);
    if (addAll.isEmpty) return false;
    return true;
  }
}
