import 'package:daily_astronomy/feature/picture_of_day/presentation/screen/nasa_pic_of_day_screen.dart';
import 'package:flutter/widgets.dart';

class RouteLocator {
  static Map<String, WidgetBuilder> get routes => {
        NasaPicOfDayScreen.ROUTE_NAME: (BuildContext context) =>
            NasaPicOfDayScreen(),
      };
}
