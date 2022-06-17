import 'package:daily_astronomy/core/config/config.dart';
import 'package:daily_astronomy/core/util/connection_checker.dart';
import 'package:daily_astronomy/feature/picture_of_day/domain/interactor/fetch_pictures_of_day_interactor.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../feature/picture_of_day/data/repository/picture_of_day_local_repository.dart';
import '../../feature/picture_of_day/data/repository/picture_of_day_remote_repository.dart';
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
  inject.registerFactory(() => ConnectionChecker(InternetConnectionChecker()));
  inject.registerFactory(() => PictureOfDayApiImpl(Client()));
  inject.registerFactory(
      () => PictureOfDayLocalStorageImpl(inject<Box<PictureOfDayEntity>>()));
  inject.registerFactory(() => FetchPicturesOfDayInteractor(
      inject<PictureOfDayLocalStorageImpl>(),
      inject<PictureOfDayApiImpl>(),
      inject<ConnectionChecker>()));
}
