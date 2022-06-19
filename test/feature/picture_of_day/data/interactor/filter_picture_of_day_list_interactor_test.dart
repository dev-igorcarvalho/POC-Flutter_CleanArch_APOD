import 'dart:convert';

import 'package:daily_astronomy/feature/picture_of_day/data/repository/picture_of_day_local_repository_impl.dart';
import 'package:daily_astronomy/feature/picture_of_day/domain/entity/picture_of_day_entity.dart';
import 'package:daily_astronomy/feature/picture_of_day/domain/interactor/filter_picture_of_day_list_interactor.dart';
import 'package:daily_astronomy/feature/picture_of_day/domain/repository/picture_of_day_local_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../helper/json_reader.dart';
import '../datasource/picture_of_day_local_repository_test.mocks.dart';

@GenerateMocks([Box<PictureOfDayEntity>])
void main() {
  final List<PictureOfDayEntity> _fixture =
      (jsonDecode(getJsonFromFile('pictureOfDayListFixture.json')) as List)
          .map((e) => PictureOfDayEntity.fromJson(e as Map<String, dynamic>))
          .toList();
  final String _title = _fixture.first.title;
  final DateTime _date = _fixture.last.date;

  group('Search picture of day', () {
    late final FilterPictureOfDayListInteractor interactor;
    late final MockBox<PictureOfDayEntity> mockBox;
    late final PictureOfDayLocalRepository cache;
    setUpAll(() {
      mockBox = MockBox();
      cache = PictureOfDayLocalRepositoryImpl(mockBox);
      interactor = FilterPictureOfDayListInteractor(cache);
      when(mockBox.values).thenAnswer((_) => _fixture);
    });
    group('Seaerch by date', () {
      late final List<PictureOfDayEntity> result;
      late final SearchPictureOfDayInteractorInput input;
      setUpAll(() {
        input = SearchPictureOfDayInteractorInput(
          date: _date,
        );
        result = interactor.execute(input);
      });
      test(
          'Should return a List.of(PictureOfDAyEntity) when a date is searched',
          () {
        expect(result, isA<List<PictureOfDayEntity>>());
      });
      test(
          'Should return a List.of(PictureOfDAyEntity) with same date as input.date',
          () {
        bool filteredResult =
            result.every((element) => element.date == input.date);
        expect(filteredResult, true);
      });
      test('Should call interactor.execute', () {
        verify(interactor.execute(input)).called(1);
      });
    });
    group('Seaerch by date', () {
      late final List<PictureOfDayEntity> result;
      late final SearchPictureOfDayInteractorInput input;
      setUpAll(() {
        input = SearchPictureOfDayInteractorInput(title: _title);
        result = interactor.execute(input);
      });
      test(
          'Should return a List.of(PictureOfDAyEntity) when a title is searched',
          () {
        expect(result, isA<List<PictureOfDayEntity>>());
      });
      test('Should return a PictureOfDAyEntity.date same as input.title', () {
        bool filteredResult =
            result.every((element) => element.title == input.title);
        expect(filteredResult, true);
      });
      test('Should call interactor.execute', () {
        verify(interactor.execute(input)).called(1);
      });
    });
  });
}
