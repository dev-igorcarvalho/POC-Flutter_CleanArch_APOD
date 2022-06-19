import 'package:daily_astronomy/feature/picture_of_day/presentation/bloc/picture_of_day_bloc.dart';
import 'package:daily_astronomy/feature/picture_of_day/presentation/widget/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/locators/dependency_locator.dart';
import '../widget/loading.dart';
import '../widget/picture_of_day_list.dart';

class NasaPicOfDayScreen extends StatelessWidget {
  const NasaPicOfDayScreen({Key? key}) : super(key: key);
  static const ROUTE_NAME = "/";

  Widget mapStateToWidget(BuildContext context, PictureOfDayState state) {
    if (state is PictureOfDayLoading) {
      context.read<PictureOfDayBloc>().add(PictureOfDayFetchListEvent());
      return Loading();
    } else if (state is PictureOfDayLoaded)
      return PictureOfDayList(
        pictures: state.data,
      );
    else if (state is PictureOfDayError)
      return Text('Something went wrong :(');
    else {
      context.read<PictureOfDayBloc>().add(PictureOfDayLoadingEvent());
      return Text('Empty');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) => inject<PictureOfDayBloc>(),
          child: BlocBuilder<PictureOfDayBloc, PictureOfDayState>(
            builder: (context, state) => Column(
              children: [
                SearchBar(
                  state: state,
                ),
                Expanded(child: mapStateToWidget(context, state)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
