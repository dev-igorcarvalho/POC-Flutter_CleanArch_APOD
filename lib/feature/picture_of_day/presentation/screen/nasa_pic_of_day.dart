import 'package:flutter/material.dart';

class NasaPicOfDayScreen extends StatelessWidget {
  const NasaPicOfDayScreen({Key? key}) : super(key: key);
  static const ROUTE_NAME = "/";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('NASA: pic o\'day'),
      ),
    );
  }
}
