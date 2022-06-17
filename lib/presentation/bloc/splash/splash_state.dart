part of 'splash_bloc.dart';

class SplashState extends Equatable {
  final Status status;
  const SplashState({
    required this.status,
  });

  @override
  List<Object> get props => [status];

  SplashState copyWith({
    Status? status,
  }) =>
      SplashState(
        status: status ?? this.status,
      );
}
