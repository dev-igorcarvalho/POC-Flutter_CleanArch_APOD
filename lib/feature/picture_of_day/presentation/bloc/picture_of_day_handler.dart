import 'package:bloc/bloc.dart';
import 'package:daily_astronomy/feature/picture_of_day/domain/entity/picture_of_day_entity.dart';
import 'package:daily_astronomy/feature/picture_of_day/presentation/bloc/picture_of_day_bloc.dart';

import '../../domain/interactor/fetch_pictures_of_day_interactor.dart';
import '../../domain/interactor/filter_picture_of_day_list_interactor.dart';

class GetPictureOfDayListEventHandler {
  final FetchPicturesOfDayInteractor fetchPicturesOfDayInteractor;

  GetPictureOfDayListEventHandler(this.fetchPicturesOfDayInteractor);

  handle(
      PictureOfDayFetchListEvent event, Emitter<PictureOfDayState> emit) async {
    DateTime now = DateTime.now();
    final FetchPicturesOfDayInteractorInput input =
        FetchPicturesOfDayInteractorInput(
            now.subtract(Duration(days: 15)), now);
    await Future.delayed(
        Duration(seconds: 1)); //just to force show the loading widget
    final result = await fetchPicturesOfDayInteractor.execute(input);
    emit(PictureOfDayLoaded(result));
  }
}

class SearchPictureOfDayListEventHandler {
  final FilterPictureOfDayListInteractor searchPictureOfDayInteractor;

  SearchPictureOfDayListEventHandler(this.searchPictureOfDayInteractor);

  handle(PictureOfDaySearchEvent event, Emitter<PictureOfDayState> emit) async {
    SearchPictureOfDayInteractorInput input =
        SearchPictureOfDayInteractorInput(title: event.title, date: event.date);
    final List<PictureOfDayEntity> result =
        await searchPictureOfDayInteractor.execute(input);
    emit(PictureOfDayLoaded(result));
  }
}
