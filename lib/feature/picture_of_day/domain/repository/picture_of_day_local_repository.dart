import 'package:daily_astronomy/feature/picture_of_day/domain/repository/picture_of_day_repository.dart';

import '../../../../core/data/datasource/local/local_cache.dart';
import '../entity/picture_of_day_entity.dart';

abstract class PictureOfDayLocalRepository
    implements PictureOfDayRepository, LocalCache<PictureOfDayEntity> {}
