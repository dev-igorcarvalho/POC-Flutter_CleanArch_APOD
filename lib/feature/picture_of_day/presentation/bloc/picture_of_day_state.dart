part of 'picture_of_day_bloc.dart';

@immutable
abstract class PictureOfDayState {}

class PictureOfDayInitial extends PictureOfDayState {}

class PictureOfDayLoading extends PictureOfDayState {}

class PictureOfDayLoaded extends PictureOfDayState {
  final List<PictureOfDayEntity> data;

  PictureOfDayLoaded(this.data);
}

class PictureOfDayError extends PictureOfDayState {
  final String msg;

  PictureOfDayError(this.msg);
}
