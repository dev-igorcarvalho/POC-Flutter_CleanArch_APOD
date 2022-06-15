import 'package:flutter/material.dart';

class NasaPicOfDayScreen extends StatelessWidget {
  const NasaPicOfDayScreen({Key? key}) : super(key: key);
  static const ROUTE_NAME = "/";

  @override
  Widget build(BuildContext context) {
    // var api = inject<PictureOfDayRepositoryImpl>();
    // api
    //     .fetchPicturesFromDateRange(
    //         startDate: DateTime.now().subtract(Duration(days: 10)))
    //     .then((value) => print(value));

    return Scaffold(
      body: Center(
        child: Text('NASA: pic o\'day'),
      ),
    );
  }
}
