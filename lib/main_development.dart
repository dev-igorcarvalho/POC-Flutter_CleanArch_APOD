import 'package:daily_astronomy/core/application_container/daily_astronomy.dart';
import 'package:daily_astronomy/core/config/config.dart';
import 'package:daily_astronomy/core/locators/dependency_locator.dart';
import 'package:flutter/widgets.dart';

void main() async {
  await init();
  Config config = Config(Api('https://api.nasa.gov/planetary/apod',
      'tB4U40zQLjlFoa6b26lTgbfDzhWzFfi8gaxe9pzI'));
  initConfig(config);
  runApp(const DailyAstronomy());
}
