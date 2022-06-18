import 'package:daily_astronomy/feature/picture_of_day/presentation/bloc/picture_of_day_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/locators/dependency_locator.dart';

class NasaPicOfDayScreen extends StatelessWidget {
  const NasaPicOfDayScreen({Key? key}) : super(key: key);
  static const ROUTE_NAME = "/";

  Widget mapStateToWidget(BuildContext context, PictureOfDayState state) {
    if (state is PictureOfDayLoading) {
      context.read<PictureOfDayBloc>().add(PictureOfDayFetchListEvent());
      return CircularProgressIndicator();
    } else if (state is PictureOfDayLoaded)
      return Text(state.data.toString());
    else if (state is PictureOfDayError)
      return Text('Error');
    else {
      context.read<PictureOfDayBloc>().add(PictureOfDayLoadingEvent());
      return Text('Empty');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => inject<PictureOfDayBloc>(),
        child: Center(
            child: BlocBuilder<PictureOfDayBloc, PictureOfDayState>(
          builder: (context, state) => mapStateToWidget(context, state),
        )),
      ),
    );
  }
}
