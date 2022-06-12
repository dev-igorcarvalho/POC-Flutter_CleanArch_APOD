import 'package:flutter/material.dart';

import '../locators/route_locator.dart';

class DailyAstronomy extends StatelessWidget {
  const DailyAstronomy({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: RouteLocator.routes,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(color: Color(0xFF13B9FF)),
        colorScheme: ColorScheme.fromSwatch(
          accentColor: const Color(0xFF13B9FF),
        ),
      ),
    );
  }
}
