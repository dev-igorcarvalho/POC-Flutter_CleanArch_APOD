import 'dart:convert';

import 'package:daily_astronomy/feature/picture_of_day/data/datasource/picture_of_day_local_storage.dart';
import 'package:daily_astronomy/feature/picture_of_day/domain/entity/picture_of_day_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../helper/json_reader.dart';
import 'picture_of_day_local_storage_test.mocks.dart';

@GenerateMocks([Box<PictureOfDayEntity>])
void main() {
  group('Fetch picture of the day list from local chache', () {
    test(
        'Should call local storage and return a cached list of PictureOfDayEntity',
        () async {
      final MockBox<PictureOfDayEntity> mockBox = MockBox();
      final PictureOfDayLocalStorage cache = PictureOfDayLocalStorage(mockBox);
      final startDate = DateTime.now().subtract(Duration(days: 10));
      final fixture =
          (jsonDecode(getJsonFromFile('pictureOfDayListFixture.json')) as List)
              .map(
                  (e) => PictureOfDayEntity.fromJson(e as Map<String, dynamic>))
              .toList();

      when(cache.localStorage.values).thenAnswer((_) => fixture);

      expect(await cache.fetchPicturesFromDateRange(startDate: startDate),
          isA<List<PictureOfDayEntity>>());
    });
  });
}
