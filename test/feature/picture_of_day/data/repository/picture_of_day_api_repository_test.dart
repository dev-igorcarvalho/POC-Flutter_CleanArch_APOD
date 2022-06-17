import 'dart:convert';

import 'package:daily_astronomy/core/config/config.dart';
import 'package:daily_astronomy/core/locators/dependency_locator.dart';
import 'package:daily_astronomy/core/util/connection_checker.dart';
import 'package:daily_astronomy/feature/picture_of_day/data/datasource/picture_of_day_api.dart';
import 'package:daily_astronomy/feature/picture_of_day/data/datasource/picture_of_day_local_storage.dart';
import 'package:daily_astronomy/feature/picture_of_day/data/repository/picture_of_day_repository_impl.dart';
import 'package:daily_astronomy/feature/picture_of_day/domain/entity/picture_of_day_entity.dart';
import 'package:daily_astronomy/feature/picture_of_day/domain/repository/picture_of_day_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart';
import 'package:http/src/client.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../helper/json_reader.dart';
import 'picture_of_day_api_repository_test.mocks.dart';

List<PictureOfDayEntity> _fixture =
    (jsonDecode(getJsonFromFile('pictureOfDayListFixture.json')) as List)
        .map((e) => PictureOfDayEntity.fromJson(e as Map<String, dynamic>))
        .toList();
DateTime startDate = DateTime.now().subtract(Duration(days: 10));

@GenerateMocks([Client, ConnectionChecker, Box<PictureOfDayEntity>])
void main() {
  final MockClient client = MockClient();
  final PictureOfDayApi api = PictureOfDayApiImpl(client);
  final MockConnectionChecker connectionChecker = MockConnectionChecker();
  final MockBox<PictureOfDayEntity> mockBox = MockBox();
  final PictureOfDayLocalStorage cache = PictureOfDayLocalStorageImpl(mockBox);
  final PictureOfDayRepository repository =
      PictureOfDayRepositoryImpl(cache, api, connectionChecker);

  Config config = Config(Api('https://api.nasa.gov/planetary/apod',
      'tB4U40zQLjlFoa6b26lTgbfDzhWzFfi8gaxe9pzI'));
  initConfig(config);
  group(
      'Fetch picture of the day list from repository, either from local cache or api',
      () {
    setUpAll(() async {
      when(client.get(any, headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      })).thenAnswer((_) async =>
          Response(getJsonFromFile('pictureOfDayListFixture.json'), 200));
      when(cache.localStorage.addAll(_fixture))
          .thenAnswer((_) async => [1, 2, 3]);
      when(cache.localStorage.values).thenAnswer((_) => _fixture);
    });
    group(
        'Fetch picture of the day list from repository with internet connection',
        () {
      late final List<PictureOfDayEntity> result;
      setUpAll(() async {
        when(connectionChecker.hasConnection()).thenAnswer((_) async => true);
        result =
            await repository.fetchPicturesFromDateRange(startDate: startDate);
      });
      test('Should return a list of PictureOfDay from api call', () async {
        expect(result, isA<List<PictureOfDayEntity>>());
      });
      test('Should call api when there is internet connection', () async {
        when(connectionChecker.hasConnection()).thenAnswer((_) async => true);
        verify(client.get(any, headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        })).called(1);
      });
    });
    group(
        'Fetch picture of the day list from repository without internet connection',
        () {
      late final List<PictureOfDayEntity> result;
      setUpAll(() async {
        when(connectionChecker.hasConnection()).thenAnswer((_) async => false);
        result =
            await repository.fetchPicturesFromDateRange(startDate: startDate);
      });
      test('Should call local storage when there is no internet connection',
          () async {
        expect(result, isA<List<PictureOfDayEntity>>());
      });
      test('Should call local storage when there is no internet connection',
          () async {
        expect(result, isA<List<PictureOfDayEntity>>());
      });
    });
  });
}
