import 'package:bloc/bloc.dart';
import 'package:daily_astronomy/feature/picture_of_day/presentation/bloc/picture_of_day_bloc.dart';

import '../../domain/interactor/fetch_pictures_of_day_interactor.dart';
import '../../domain/interactor/search_picture_of_day_interactor.dart';

class GetPictureOfDayListEventHandler {
  final FetchPicturesOfDayInteractor fetchPicturesOfDayInteractor;

  GetPictureOfDayListEventHandler(this.fetchPicturesOfDayInteractor);

  handle(
      PictureOfDayFetchListEvent event, Emitter<PictureOfDayState> emit) async {
    DateTime now = DateTime.now();
    final FetchPicturesOfDayInteractorInput input =
        FetchPicturesOfDayInteractorInput(
            now.subtract(Duration(days: 10)), now);
    await Future.delayed(Duration(seconds: 3));
    final result = await fetchPicturesOfDayInteractor.execute(input);
    emit(PictureOfDayLoaded(result));
  }
}

class SearchPictureOfDayListEventHandler {
  final SearchPictureOfDayInteractor searchPictureOfDayInteractor;

  SearchPictureOfDayListEventHandler(this.searchPictureOfDayInteractor);

  handle(PictureOfDaySearchEvent event, Emitter<PictureOfDayState> emit) async {
    throw UnimplementedError();
  }
}
