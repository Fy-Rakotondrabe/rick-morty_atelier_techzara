import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_morty_test/core/constants/routes.dart';
import 'package:rick_morty_test/core/constants/status.dart';
import 'package:rick_morty_test/presentation/bloc/splash/splash_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: BlocConsumer<SplashBloc, SplashState>(
        listener: (context, state) {
          if (state.status == Status.success) {
            Navigator.pushReplacementNamed(context, Routes.layout);
          }
        },
        builder: (context, state) {
          return Center(
            child: SizedBox(
              height: 160,
              width: 160,
              child: Image.asset('images/rm.png'),
            ),
          );
        },
      ),
    );
  }
}
