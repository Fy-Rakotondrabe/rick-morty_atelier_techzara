import 'package:flutter/material.dart';
import 'package:rick_morty_test/core/constants/routes.dart';
import 'package:rick_morty_test/presentation/bloc/navigation/navigation_bloc.dart';
import 'package:rick_morty_test/presentation/layout/layout.dart';
import 'package:rick_morty_test/presentation/views/favs/favs.dart';
import 'package:rick_morty_test/presentation/views/home/home.dart';
import 'package:rick_morty_test/presentation/views/splash/splash.dart';

abstract class AppRoute {
  static String initial = Routes.splash;

  static Map<String, Widget Function(BuildContext)> routes = {
    Routes.splash: (context) => const SplashScreen(),
    Routes.layout: (context) => const Layout(),
  };

  static Widget activeScreen(
    NavigationState navigationState,
  ) {
    final String path = navigationState.path;

    switch (path) {
      case Routes.home:
        return const HomeScreen();
      case Routes.favs:
        return const FavsScreen();
    }

    return const HomeScreen();
  }
}
