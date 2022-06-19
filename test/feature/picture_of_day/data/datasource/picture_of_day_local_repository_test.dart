import 'dart:convert';

import 'package:daily_astronomy/feature/picture_of_day/data/repository/picture_of_day_local_repository_impl.dart';
import 'package:daily_astronomy/feature/picture_of_day/domain/entity/picture_of_day_entity.dart';
import 'package:daily_astronomy/feature/picture_of_day/domain/repository/picture_of_day_local_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../helper/json_reader.dart';
import 'picture_of_day_local_repository_test.mocks.dart';

@GenerateMocks([Box<PictureOfDayEntity>])
void main() {
  group('Fetch picture of the day list from local chache', () {
    late final startDate;
    late final fixture;
    late final MockBox<PictureOfDayEntity> mockBox;
    late final PictureOfDayLocalRepository cache;
    setUpAll(() {
      startDate = DateTime.now().subtract(Duration(days: 10));
      fixture = (jsonDecode(getJsonFromFile('pictureOfDayListFixture.json'))
              as List)
          .map((e) => PictureOfDayEntity.fromJson(e as Map<String, dynamic>))
          .toList();

      mockBox = MockBox();
      cache = PictureOfDayLocalRepositoryImpl(mockBox);
      when(mockBox.clear()).thenAnswer((_) async => 1);
      when(mockBox.addAll(fixture)).thenAnswer((_) async => [1, 2, 3]);
    });
    test(
        'Should call local storage and return a cached list of PictureOfDayEntity',
        () async {
      when(mockBox.values).thenAnswer((_) => fixture);

      expect(await cache.fetchPicturesFromDateRange(startDate: startDate),
          isA<List<PictureOfDayEntity>>());
    });
    test('Should return true if values are chaced', () async {
      expect(await cache.cachePicturesOfDay(pictures: fixture), isA<bool>());
    });
  });
}
