import 'package:daily_astronomy/core/data/datasource/local/local_cache.dart';
import 'package:daily_astronomy/feature/picture_of_day/data/datasource/picture_of_day_datasource.dart';
import 'package:hive/hive.dart';

import '../../../../core/data/datasource/local/local_storage_adapter.dart';
import '../../domain/entity/picture_of_day_entity.dart';

class PictureOfDayLocalStorage
    extends LocalStorageAdapter<Box<PictureOfDayEntity>>
    implements PictureOfDayDataSource, LocalCache<PictureOfDayEntity> {
  PictureOfDayLocalStorage(super.localStorage);

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
