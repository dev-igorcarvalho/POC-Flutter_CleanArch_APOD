import 'package:daily_astronomy/feature/picture_of_day/domain/repository/picture_of_day_repository.dart';
import 'package:http/http.dart';

import '../../../../core/adapter/api_adapter.dart';

///Interface to specify the use of PictureOfDayRemoteRepository
abstract class PictureOfDayRemoteRepository extends ApiAdapter<Client>
    implements PictureOfDayRepository {
  PictureOfDayRemoteRepository(super.api);
}
