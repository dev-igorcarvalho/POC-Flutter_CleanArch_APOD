part of 'picture_of_day_bloc.dart';

@immutable
abstract class PictureOfDayEvent {}

class PictureOfDayLoadingEvent extends PictureOfDayEvent {}

class PictureOfDayFetchListEvent extends PictureOfDayEvent {}

class PictureOfDaySearchEvent extends PictureOfDayEvent {
  final String? title;
  final DateTime? date;

  PictureOfDaySearchEvent({this.title, this.date});
}
