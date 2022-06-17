part of 'navigation_bloc.dart';

abstract class NavigationEvent extends Equatable {
  const NavigationEvent();

  @override
  List<Object> get props => [];
}

class OnNavigate extends NavigationEvent {
  final String path;

  const OnNavigate({
    required this.path,
  });

  @override
  List<Object> get props => [path];
}
