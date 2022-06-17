import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_morty_test/core/constants/status.dart';
import 'package:rick_morty_test/presentation/bloc/favs/favs_bloc.dart';
import 'package:rick_morty_test/presentation/widgets/characters_item.dart';

class FavsScreen extends StatelessWidget {
  const FavsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FavsBloc, FavsState>(
      listener: (context, state) {
        if (state.status == Status.serverError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Erreur serveur'),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      builder: (context, state) {
        if (state.status == Status.loading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Container(
            color: Theme.of(context).primaryColor,
            child: ListView.builder(
              itemCount: state.characters.length,
              itemBuilder: (BuildContext context, int index) {
                var character = state.characters[index];
                return CharacterItem(
                  character: character,
                  showFavAction: false,
                );
              },
            ),
          );
        }
      },
    );
  }
}
