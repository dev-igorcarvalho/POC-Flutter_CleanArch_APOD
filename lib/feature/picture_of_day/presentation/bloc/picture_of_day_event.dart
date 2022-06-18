part of 'picture_of_day_bloc.dart';

@immutable
abstract class PictureOfDayEvent {}

class LoadingPictureOfDayListEvent extends PictureOfDayEvent {}

class GetPictureOfDayListEvent extends PictureOfDayEvent {}

class SearchPictureOfDayEvent extends PictureOfDayEvent {
  final String title;
  final DateTime date;

  SearchPictureOfDayEvent(this.title, this.date);
}
