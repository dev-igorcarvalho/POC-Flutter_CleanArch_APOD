import 'package:daily_astronomy/core/config/config.dart';
import 'package:daily_astronomy/core/util/connection_checker.dart';
import 'package:daily_astronomy/feature/picture_of_day/domain/interactor/fetch_pictures_of_day_interactor.dart';
import 'package:daily_astronomy/feature/picture_of_day/domain/interactor/search_picture_of_day_interactor.dart';
import 'package:daily_astronomy/feature/picture_of_day/presentation/bloc/picture_of_day_bloc.dart';
import 'package:daily_astronomy/feature/picture_of_day/presentation/bloc/picture_of_day_handler.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../feature/picture_of_day/data/repository/picture_of_day_local_repository_impl.dart';
import '../../feature/picture_of_day/data/repository/picture_of_day_remote_repository_iplm.dart';
import '../../feature/picture_of_day/domain/entity/picture_of_day_entity.dart';

final GetIt inject = GetIt.instance;

Future init() async {
  await _initLocalStorage();
  _initCore();
  _initModules();
}

Future _initLocalStorage() async {
  await Hive.initFlutter();
  Hive.registerAdapter(PictureOfDayEntityAdapter());
  Box<PictureOfDayEntity> box = await Hive.openBox<PictureOfDayEntity>('APOD');
  inject.registerSingleton(box);
}

void initConfig(Config config) {
  inject.registerSingleton(config);
}

void _initCore() {}

void _initModules() {
  _initPictureOfDay();
}

void _initPictureOfDay() {
  inject.registerFactory(() => ConnectionChecker(InternetConnectionChecker()));
  inject.registerFactory(() => PictureOfDayRemoteRepositoryImpl(Client()));
  inject.registerFactory(
      () => PictureOfDayLocalRepositoryImpl(inject<Box<PictureOfDayEntity>>()));
  inject.registerFactory(() => FetchPicturesOfDayInteractor(
      inject<PictureOfDayLocalRepositoryImpl>(),
      inject<PictureOfDayRemoteRepositoryImpl>(),
      inject<ConnectionChecker>()));
  inject.registerFactory(() => SearchPictureOfDayInteractor());
  inject.registerFactory(() => GetPictureOfDayListEventHandler());
  inject.registerFactory(() => SearchPictureOfDayListEventHandler());
  inject.registerSingleton(
      () => PictureOfDayBloc(fecthHandler: inject(), searchHandler: inject()));
}
