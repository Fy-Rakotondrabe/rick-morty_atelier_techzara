import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rick_morty_test/presentation/theme/app_theme.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState(theme: AppTheme.dark)) {
    on<OnChangeTheme>(_onChangeTheme);
  }

  Future<void> _onChangeTheme(
    OnChangeTheme event,
    Emitter<ThemeState> emit,
  ) async {
    emit(state.copyWith(
      theme: state.theme == AppTheme.dark ? AppTheme.light : AppTheme.dark,
    ));
  }
}
