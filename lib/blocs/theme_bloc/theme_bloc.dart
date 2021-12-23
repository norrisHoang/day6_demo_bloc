import 'package:bloc/bloc.dart';
import 'theme_events.dart';
import 'theme_states.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChangeThemeBloc extends Bloc<ChangeThemeEvent, ThemeState> {
  ChangeThemeBloc(ThemeState init) : super(init){
    on<LightTheme>((event, emit) async {
      await _getData(event.isLight, emit);
    });
  }

  Future<ThemeState?> _getData(
      bool isLight, Emitter<ThemeState> emit) async {
    if (isLight) {
      emit(ThemeLight(ThemeState));

      // print('inside Lighttheme body');
      // try {
      //   _saveOptionValue(0);
      // } catch (_) {
      //   throw Exception("Could not persist change");
      // }
    } else {
      emit(ThemeDark(ThemeState));
      // print('inside DarkTheme body');
      // try {
      //   _saveOptionValue(1);
      // } catch (_) {
      //   throw Exception("Could not persist change");
      // }
    }
  }
  //
  // Future<Null> _saveOptionValue(int optionValue) async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   preferences.setInt('theme_option', optionValue);
  //   print('Saving option value as $optionValue successfully');
  // }
  //
  // Future<int> getOption() async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   int option = preferences.getInt('theme_option') ?? 0;
  //   return option;
  // }
}
