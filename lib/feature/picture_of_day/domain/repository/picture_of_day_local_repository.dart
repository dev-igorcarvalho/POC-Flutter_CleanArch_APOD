import '../../../../core/data/datasource/local/local_cache.dart';
import '../../data/datasource/picture_of_day_datasource.dart';
import '../entity/picture_of_day_entity.dart';

abstract class PictureOfDayLocalRepository
    implements PictureOfDayDataSource, LocalCache<PictureOfDayEntity> {}
