import 'package:rick_morty_test/presentation/theme/dark.dart';
import 'package:rick_morty_test/presentation/theme/light.dart';

enum AppTheme { light, dark }

final appThemeData = {
  AppTheme.light: lightTheme(),
  AppTheme.dark: darkTheme(),
};
