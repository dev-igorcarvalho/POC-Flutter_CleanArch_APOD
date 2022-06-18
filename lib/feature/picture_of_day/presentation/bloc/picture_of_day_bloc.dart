import 'package:bloc/bloc.dart';
import 'package:daily_astronomy/feature/picture_of_day/domain/entity/picture_of_day_entity.dart';
import 'package:daily_astronomy/feature/picture_of_day/presentation/bloc/picture_of_day_handler.dart';
import 'package:meta/meta.dart';

part 'picture_of_day_event.dart';
part 'picture_of_day_state.dart';

class PictureOfDayBloc extends Bloc<PictureOfDayEvent, PictureOfDayState> {
  PictureOfDayBloc(
      {required GetPictureOfDayListEventHandler fecthHandler,
      required SearchPictureOfDayListEventHandler searchHandler})
      : super(PictureOfDayInitial()) {
    on<GetPictureOfDayListEvent>(
        (event, emit) => fecthHandler.handle(event, emit));
    on<SearchPictureOfDayEvent>(
        (event, emit) => searchHandler.handle(event, emit));
  }
}
