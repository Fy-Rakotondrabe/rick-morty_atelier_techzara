import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rick_morty_test/core/constants/routes.dart';

part 'navigation_event.dart';
part 'navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(const NavigationState(path: Routes.home)) {
    on<OnNavigate>(_onNavigate);
  }

  Future<void> _onNavigate(
      OnNavigate event, Emitter<NavigationState> emit) async {
    emit(state.copyWith(path: event.path));
  }
}
