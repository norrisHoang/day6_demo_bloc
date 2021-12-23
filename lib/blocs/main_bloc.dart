import 'package:day5_demo/blocs/theme_bloc/theme_events.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'theme_bloc/theme_bloc.dart';
import 'package:day5_demo/models/themes_app.dart';
import 'theme_bloc/theme_states.dart';

class MainBloc {
  static List<BlocProvider> allBlocs() {
    return [
      // Data bloc
      BlocProvider<ChangeThemeBloc>(
        create: (BuildContext context) => ChangeThemeBloc(ThemeDark(ThemeData)),
      ),
      // Theme bloc...
    ];
  }
}