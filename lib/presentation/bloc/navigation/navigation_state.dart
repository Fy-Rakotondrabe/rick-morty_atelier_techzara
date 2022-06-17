part of 'navigation_bloc.dart';

class NavigationState extends Equatable {
  final String path;

  const NavigationState({
    required this.path,
  });

  @override
  List<Object> get props => [path];

  NavigationState copyWith({String? path}) =>
      NavigationState(path: path ?? this.path);
}
