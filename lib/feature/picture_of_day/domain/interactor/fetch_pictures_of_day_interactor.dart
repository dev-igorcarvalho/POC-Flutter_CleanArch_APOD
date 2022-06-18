import 'dart:developer';

import 'package:daily_astronomy/feature/picture_of_day/domain/entity/picture_of_day_entity.dart';

import '../../../../core/adapter/connection_checker_adapter.dart';
import '../../../../core/interactor/future_interactor.dart';
import '../repository/picture_of_day_local_repository.dart';
import '../repository/picture_of_day_remote_repository.dart';

class FetchPicturesOfDayInteractor
    implements
        FutureInteractor<FetchPicturesOfDayInteractorInput,
            List<PictureOfDayEntity>> {
  final PictureOfDayLocalRepository _localStorage;
  final PictureOfDayRemoteRepository _api;
  final ConnectionCheckerAdapter _connectionChecker;

  FetchPicturesOfDayInteractor(
      this._localStorage, this._api, this._connectionChecker);

  @override
  Future<List<PictureOfDayEntity>> execute(
      FetchPicturesOfDayInteractorInput input) async {
    bool hasConnection = await _connectionChecker.hasConnection();
    if (hasConnection) {
      log('Internet connection is fine, getting data from NASA APOD API');
      var result = await _api.fetchPicturesFromDateRange(
          startDate: input.startDate, endDate: input.endDate);
      // _localStorage.cachePicturesOfDay(pictures: result);
      return result;
    } else {
      log('No internet connection, getting data from local cache');
      final result = await _localStorage.fetchPicturesFromDateRange(
          startDate: input.startDate, endDate: input.endDate);
      return result;
    }
  }
}

class FetchPicturesOfDayInteractorInput {
  final DateTime startDate;
  final DateTime endDate;

  FetchPicturesOfDayInteractorInput(this.startDate, this.endDate);
}
