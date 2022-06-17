import 'dart:developer';

import 'package:daily_astronomy/feature/picture_of_day/data/datasource/picture_of_day_api.dart';
import 'package:daily_astronomy/feature/picture_of_day/data/datasource/picture_of_day_local_storage.dart';
import 'package:daily_astronomy/feature/picture_of_day/domain/entity/picture_of_day_entity.dart';
import 'package:daily_astronomy/feature/picture_of_day/domain/repository/picture_of_day_repository.dart';

import '../../../../core/adapter/connection_checker_adapter.dart';

class PictureOfDayRepositoryImpl implements PictureOfDayRepository {
  final PictureOfDayLocalStorage _localStorage;
  final PictureOfDayApi _api;
  final ConnectionCheckerAdapter _connectionChecker;

  PictureOfDayRepositoryImpl(
      this._localStorage, this._api, this._connectionChecker);

  @override
  Future<List<PictureOfDayEntity>> fetchPicturesFromDateRange(
      {required DateTime startDate, DateTime? endDate}) async {
    bool hasConnection = await _connectionChecker.hasConnection();
    if (hasConnection) {
      log('Internet connection is fine, getting data from NASA APOD API');
      var result = await _api.fetchPicturesFromDateRange(
          startDate: startDate, endDate: endDate ?? DateTime.now());
      // _localStorage.cachePicturesOfDay(pictures: result);
      return result;
    } else {
      log('No internet connection, getting data from local cache');
      final result = await _localStorage.fetchPicturesFromDateRange(
          startDate: startDate, endDate: endDate ?? DateTime.now());
      return result;
    }
  }
}
