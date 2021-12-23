abstract class ChangeThemeEvent {}


class LightTheme extends ChangeThemeEvent {
  late final bool isLight;

  LightTheme({this.isLight = true});
}