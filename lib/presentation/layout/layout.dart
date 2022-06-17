import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_morty_test/core/constants/routes.dart';
import 'package:rick_morty_test/presentation/bloc/navigation/navigation_bloc.dart';
import 'package:rick_morty_test/presentation/bloc/theme/theme_bloc.dart';
import 'package:rick_morty_test/presentation/routes/routes.dart';
import 'package:rick_morty_test/presentation/theme/app_theme.dart';

class Layout extends StatelessWidget {
  const Layout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBloc, NavigationState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Rick & Morty',
              style: Theme.of(context).textTheme.headline1,
            ),
            backgroundColor: Theme.of(context).primaryColor,
          ),
          body: AppRoute.activeScreen(state),
          floatingActionButton: BlocBuilder<ThemeBloc, ThemeState>(
            builder: (context, themeState) {
              return FloatingActionButton(
                backgroundColor: Theme.of(context).secondaryHeaderColor,
                child: IconTheme(
                  child: Icon(
                    themeState.theme == AppTheme.dark
                        ? Icons.dark_mode_outlined
                        : Icons.light_mode_outlined,
                  ),
                  data: Theme.of(context).iconTheme,
                ),
                onPressed: () => context.read<ThemeBloc>().add(OnChangeTheme()),
              );
            },
          ),
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index) {
              context.read<NavigationBloc>().add(
                    OnNavigate(
                      path: index == 0 ? Routes.home : Routes.favs,
                    ),
                  );
            },
            backgroundColor: Theme.of(context).primaryColor,
            selectedItemColor: Colors.green,
            unselectedItemColor: Theme.of(context).secondaryHeaderColor,
            currentIndex: state.path == Routes.home ? 0 : 1,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                label: "Characters",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite_outline_outlined),
                label: "Favs",
              ),
            ],
          ),
        );
      },
    );
  }
}
