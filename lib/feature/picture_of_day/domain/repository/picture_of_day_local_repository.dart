import 'package:daily_astronomy/feature/picture_of_day/domain/repository/picture_of_day_repository.dart';
import 'package:hive/hive.dart';

import '../../../../core/adapter/local_storage_adapter.dart';
import '../../../../core/data/datasource/local/local_cache.dart';
import '../entity/picture_of_day_entity.dart';

///Interface to specify the use of PictureOfDayLocalRepository
abstract class PictureOfDayLocalRepository
    extends LocalStorageAdapter<Box<PictureOfDayEntity>>
    implements PictureOfDayRepository, LocalCache<PictureOfDayEntity> {
  PictureOfDayLocalRepository(super.localStorage);
}
