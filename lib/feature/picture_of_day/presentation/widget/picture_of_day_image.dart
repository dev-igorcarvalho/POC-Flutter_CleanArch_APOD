import 'package:flutter/material.dart';

import 'loading.dart';

class PictureOfDayImage extends StatelessWidget {
  final String url;

  const PictureOfDayImage({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      url,
      loadingBuilder: (BuildContext context, Widget child,
          ImageChunkEvent? loadingProgress) {
        if (loadingProgress == null) return child;
        return Loading();
      },
    );
  }
}
