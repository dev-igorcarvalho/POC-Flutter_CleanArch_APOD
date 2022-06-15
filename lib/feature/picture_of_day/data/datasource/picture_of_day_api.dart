import 'dart:convert';

import 'package:daily_astronomy/feature/picture_of_day/data/datasource/picture_of_day_datasource.dart';
import 'package:http/http.dart';

import '../../../../core/data/datasource/http/generic_api.dart';
import '../../domain/entity/picture_of_day_entity.dart';

class PictureOfDayApi extends GenericApi implements PictureOfDayDataSource {
  final Client httpClient;

  PictureOfDayApi(this.httpClient);

  @override
  Future<List<PictureOfDayEntity>> fetchPicturesFromDateRange(
      {required DateTime startDate, DateTime? endDate}) async {
    final String apiDateFormat = startDate.toString().split(' ')[0];
    Uri url = getPathWithParams({'start_date': apiDateFormat});
    final response = await httpClient.get(url, headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    });
    final List<PictureOfDayEntity> result =
        (jsonDecode(utf8.decode(response.bodyBytes)) as List)
            .map((e) => PictureOfDayEntity.fromJson(e as Map<String, dynamic>))
            .toList();
    return result;
  }
}
