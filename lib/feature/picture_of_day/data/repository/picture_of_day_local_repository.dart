import 'package:daily_astronomy/feature/picture_of_day/domain/repository/picture_of_day_local_repository.dart';
import 'package:hive/hive.dart';

import '../../../../core/adapter/local_storage_adapter.dart';
import '../../domain/entity/picture_of_day_entity.dart';

abstract class PictureOfDayLocalRepositoryImpl
    extends LocalStorageAdapter<Box<PictureOfDayEntity>>
    implements PictureOfDayLocalRepository {
  PictureOfDayLocalRepositoryImpl(super.localStorage);
}

class PictureOfDayLocalStorageImpl extends PictureOfDayLocalRepositoryImpl {
  PictureOfDayLocalStorageImpl(super.localStorage);

  @override
  Future<List<PictureOfDayEntity>> fetchPicturesFromDateRange(
      {required DateTime startDate, DateTime? endDate}) async {
    return localStorage.values.toList();
  }

  @override
  Future<bool> cachePicturesOfDay(
      {required List<PictureOfDayEntity> pictures}) async {
    Iterable<int> addAll = await localStorage.addAll(pictures);
    if (addAll.isEmpty) return false;
    return true;
  }
}
