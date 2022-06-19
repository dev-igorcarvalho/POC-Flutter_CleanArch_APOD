import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/picture_of_day_bloc.dart';

class SearchBar extends StatefulWidget {
  final PictureOfDayState state;

  SearchBar({Key? key, required this.state}) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final TextEditingController textController = new TextEditingController();

  void filter(BuildContext context, PictureOfDayState state) {
    if (state is PictureOfDayLoaded) {
      context
          .read<PictureOfDayBloc>()
          .add(PictureOfDaySearchEvent(title: textController.text));
    }
  }

  void clearFilter() {
    textController.clear();
    context
        .read<PictureOfDayBloc>()
        .add(PictureOfDaySearchEvent(title: textController.text));
  }

  Widget searchOrClearIcon(BuildContext context) {
    if (textController.text.isEmpty) {
      return Icon(
        Icons.search,
      );
    }
    return IconButton(
      onPressed: clearFilter,
      icon: Icon(
        Icons.clear,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextFormField(
        onChanged: (_) => filter(context, widget.state),
        controller: textController,
        // initialValue: DateTime.now().toIso8601String(),
        decoration: InputDecoration(
          labelText: 'Search',
          suffixIcon: searchOrClearIcon(context),
          enabledBorder: OutlineInputBorder(),
        ),
      ),
    );
  }
}
