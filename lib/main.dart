import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_morty_test/core/constants/routes.dart';
import 'package:rick_morty_test/data/repository/character_repository.dart';
import 'package:rick_morty_test/data/repository/favs_repository.dart';
import 'package:rick_morty_test/data/source/local/favs_service.dart';
import 'package:rick_morty_test/data/source/server/character_service.dart';
import 'package:rick_morty_test/presentation/bloc/favs/favs_bloc.dart';
import 'package:rick_morty_test/presentation/bloc/home/home_bloc.dart';
import 'package:rick_morty_test/presentation/bloc/navigation/navigation_bloc.dart';
import 'package:rick_morty_test/presentation/bloc/splash/splash_bloc.dart';
import 'package:rick_morty_test/presentation/bloc/theme/theme_bloc.dart';
import 'package:rick_morty_test/presentation/routes/routes.dart';
import 'package:rick_morty_test/presentation/theme/app_theme.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );
  BlocOverrides.runZoned(() => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final CharacterRepository characterRepository = CharacterRepository(
      service: CharacterService(),
    );

    final FavsRepository favsRepository = FavsRepository(
      service: FavsService(),
    );
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ThemeBloc()),
        BlocProvider(
          create: (context) => HomeBloc(
            characterRepository: characterRepository,
          )..add(OnFind()),
        ),
        BlocProvider(
          create: (context) => FavsBloc(
            favsRepository: favsRepository,
          )..add(GetFav()),
        ),
        BlocProvider(create: (context) => NavigationBloc()),
        BlocProvider(
          create: (context) => SplashBloc()..add(OnRedirect()),
        ),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Rick & Morty',
            routes: AppRoute.routes,
            theme: appThemeData[state.theme],
            debugShowCheckedModeBanner: false,
            initialRoute: Routes.splash,
          );
        },
      ),
    );
  }
}
