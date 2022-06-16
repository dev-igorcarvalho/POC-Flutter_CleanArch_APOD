import 'package:daily_astronomy/core/config/config.dart';
import 'package:daily_astronomy/feature/picture_of_day/data/datasource/picture_of_day_api.dart';
import 'package:daily_astronomy/feature/picture_of_day/data/repository/picture_of_day_repository_impl.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart';

import '../../feature/picture_of_day/data/datasource/picture_of_day_local_storage.dart';
import '../../feature/picture_of_day/domain/entity/picture_of_day_entity.dart';

final GetIt inject = GetIt.instance;

Future init() async {
  await _initLocalStorage();
  _initCore();
  _initModules();
}

Future _initLocalStorage() async {
  await Hive.initFlutter();
  Box<PictureOfDayEntity> box = await Hive.openBox('APOD');
  inject.registerSingleton(box);
}

void initConfig(Config config) {
  inject.registerSingleton(config);
}

void _initCore() {}

void _initModules() {
  inject.registerFactory(() => PictureOfDayApi(Client()));
  inject.registerFactory(
      () => PictureOfDayLocalStorage(inject<Box<PictureOfDayEntity>>()));
  inject.registerFactory(() => PictureOfDayRepositoryImpl(
      inject<PictureOfDayLocalStorage>(), inject<PictureOfDayApi>()));
}
