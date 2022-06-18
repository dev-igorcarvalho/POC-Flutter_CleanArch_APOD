import 'dart:convert';

import 'package:daily_astronomy/feature/picture_of_day/domain/entity/picture_of_day_entity.dart';
import 'package:daily_astronomy/feature/picture_of_day/domain/interactor/search_picture_of_day_interactor.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../helper/json_reader.dart';

void main() {
  final List<PictureOfDayEntity> _fixture =
      (jsonDecode(getJsonFromFile('pictureOfDayListFixture.json')) as List)
          .map((e) => PictureOfDayEntity.fromJson(e as Map<String, dynamic>))
          .toList();
  final String _title = _fixture.first.title;
  final DateTime _date = _fixture.last.date;
  group('Search picture of day', () {
    late final SearchPictureOfDayInteractor interactor;
    setUpAll(() => interactor = SearchPictureOfDayInteractor());
    group('Seaerch by date', () {
      late final PictureOfDayEntity result;
      late final SearchPictureOfDayInteractorInput input;
      setUpAll(() {
        input =
            SearchPictureOfDayInteractorInput(date: _date, source: _fixture);
        result = interactor.execute(input);
      });
      test('Should return a PictureOfDAyEntity when a date is searched', () {
        expect(result, isA<PictureOfDayEntity>());
      });
      test('Should return a PictureOfDAyEntity.date same as inpute.date', () {
        expect(result.date, input.date);
      });
      test('Should call interactor.execute', () {
        verify(interactor.execute(input)).called(1);
      });
    });
    group('Seaerch by date', () {
      late final PictureOfDayEntity result;
      late final SearchPictureOfDayInteractorInput input;
      setUpAll(() {
        input =
            SearchPictureOfDayInteractorInput(title: _title, source: _fixture);
        result = interactor.execute(input);
      });
      test('Should return a PictureOfDAyEntity when a title is searched', () {
        expect(result, isA<PictureOfDayEntity>());
      });
      test('Should return a PictureOfDAyEntity.date same as inpute.date', () {
        expect(result.title, input.title);
      });
      test('Should call interactor.execute', () {
        verify(interactor.execute(input)).called(1);
      });
    });
  });
}
