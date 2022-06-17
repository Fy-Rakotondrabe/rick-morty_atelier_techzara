part of 'theme_bloc.dart';

class ThemeState extends Equatable {
  final AppTheme theme;

  const ThemeState({
    required this.theme,
  });

  @override
  List<Object> get props => [theme];

  ThemeState copyWith({
    AppTheme? theme,
  }) =>
      ThemeState(
        theme: theme ?? this.theme,
      );
}
