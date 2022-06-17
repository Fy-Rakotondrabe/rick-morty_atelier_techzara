import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rick_morty_test/core/constants/status.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashState(status: Status.empty)) {
    on<OnRedirect>(_onRedirect);
  }

  Future<void> _onRedirect(
    OnRedirect event,
    Emitter<SplashState> emit,
  ) async {
    await Future.delayed(Duration(seconds: 2));
    emit(state.copyWith(status: Status.success));
  }
}
