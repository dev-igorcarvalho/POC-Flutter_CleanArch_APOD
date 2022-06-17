import 'package:daily_astronomy/core/config/config.dart';
import 'package:daily_astronomy/core/locators/dependency_locator.dart';
import 'package:daily_astronomy/feature/picture_of_day/data/datasource/picture_of_day_api.dart';
import 'package:daily_astronomy/feature/picture_of_day/domain/entity/picture_of_day_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../helper/json_reader.dart';
import 'picture_of_day_api_test.mocks.dart';

@GenerateMocks([Client])
void main() {
  setUp(() {
    Config config = Config(Api('https://api.nasa.gov/planetary/apod',
        'tB4U40zQLjlFoa6b26lTgbfDzhWzFfi8gaxe9pzI'));
    initConfig(config);
  });

  group('Fetch picture of the day list', () {
    test('Should call selected api and return a list of PictureOfDayEntity',
        () async {
      final MockClient client = MockClient();
      final PictureOfDayApiImpl api = PictureOfDayApiImpl(client);
      var startDate = DateTime.now().subtract(Duration(days: 10));
      when(client.get(any, headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      })).thenAnswer((_) async =>
          Response(getJsonFromFile('pictureOfDayListFixture.json'), 200));
      expect(await api.fetchPicturesFromDateRange(startDate: startDate),
          isA<List<PictureOfDayEntity>>());
    });
  });
}
