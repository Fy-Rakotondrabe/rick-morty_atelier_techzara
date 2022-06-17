import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_morty_test/data/models/character_model.dart';
import 'package:rick_morty_test/presentation/bloc/favs/favs_bloc.dart';
import 'package:rick_morty_test/presentation/widgets/characters_modal.dart';

class CharacterItem extends StatelessWidget {
  final CharacterModel character;
  final bool showFavAction;

  const CharacterItem({
    Key? key,
    required this.character,
    required this.showFavAction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                backgroundColor: Colors.transparent,
                constraints: BoxConstraints(
                  maxHeight: double.infinity,
                  minHeight: MediaQuery.of(context).size.height,
                ),
                builder: (context) => CharacterModal(
                  character: character,
                ),
              );
            },
            child: Container(
              child: Row(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: new BoxDecoration(
                      borderRadius: new BorderRadius.circular(16),
                      image: new DecorationImage(
                        image: new NetworkImage(
                          character.image,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        character.status,
                        style: TextStyle(
                          color: character.status == 'Alive'
                              ? Colors.green
                              : Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        character.name,
                        style: Theme.of(context).textTheme.headline3,
                      ),
                      Text(
                        '${character.species} - ${character.gender}',
                        style: Theme.of(context).textTheme.bodyText1,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          if (showFavAction)
            BlocBuilder<FavsBloc, FavsState>(
              builder: (context, favState) {
                bool isFav = favState.characters
                        .indexWhere((element) => element.id == character.id) !=
                    -1;
                return IconButton(
                  onPressed: () {
                    context.read<FavsBloc>().add(
                          isFav
                              ? RemoveFav(id: character.id)
                              : AddToFav(character: character),
                        );
                  },
                  icon: Icon(
                    isFav ? Icons.favorite : Icons.favorite_outline,
                    color: Theme.of(context).secondaryHeaderColor,
                  ),
                );
              },
            )
        ],
      ),
    );
  }
}
