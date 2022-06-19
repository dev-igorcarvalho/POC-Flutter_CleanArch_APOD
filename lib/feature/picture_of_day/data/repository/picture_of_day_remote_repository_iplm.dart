import 'dart:convert';

import '../../../../core/config/config.dart';
import '../../../../core/locators/dependency_locator.dart';
import '../../domain/entity/picture_of_day_entity.dart';
import '../../domain/repository/picture_of_day_remote_repository.dart';

class PictureOfDayRemoteRepositoryImpl extends PictureOfDayRemoteRepository {
  PictureOfDayRemoteRepositoryImpl(super.api);

  ///Generate an URI with APOD API specifications
  Uri getPathWithParams(Map<String, String> params) {
    final Config config = inject<Config>();
    String url = '${config.api.url}?api_key=${config.api.key}';
    params.forEach((key, value) {
      url += '&$key=$value';
    });
    return Uri.parse(url);
  }

  ///Fetch all elements of the specified api in data range
  @override
  Future<List<PictureOfDayEntity>> fetchPicturesFromDateRange(
      {required DateTime startDate, DateTime? endDate}) async {
    final String apiDateFormat = startDate.toString().split(' ')[0];
    Uri url = getPathWithParams({'start_date': apiDateFormat});
    final response = await api.get(url, headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    });
    final List<PictureOfDayEntity> result =
        (jsonDecode(utf8.decode(response.bodyBytes)) as List)
            .map((e) => PictureOfDayEntity.fromJson(e as Map<String, dynamic>))
            .toList();
    return result;
  }
}
