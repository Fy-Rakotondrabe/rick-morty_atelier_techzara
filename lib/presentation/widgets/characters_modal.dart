import 'package:flutter/material.dart';
import 'package:rick_morty_test/data/models/character_model.dart';

class CharacterModal extends StatelessWidget {
  final CharacterModel character;

  const CharacterModal({
    Key? key,
    required this.character,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          height: MediaQuery.of(context).size.height * .56,
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 80,
              ),
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Text(
                      character.name,
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    Text(
                      character.status,
                      style: TextStyle(
                        color: character.status == 'Alive'
                            ? Colors.green
                            : Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 32,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Info(
                    label: 'Gender',
                    value: character.gender,
                  ),
                  Info(
                    label: 'Species',
                    value: character.species,
                  ),
                  Info(
                    label: 'Type',
                    value: character.type,
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * .32,
          child: Container(
            height: 160,
            width: 160,
            decoration: new BoxDecoration(
              borderRadius: new BorderRadius.circular(80),
              image: new DecorationImage(
                image: new NetworkImage(
                  character.image,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class Info extends StatelessWidget {
  const Info({
    Key? key,
    required this.label,
    required this.value,
  }) : super(key: key);

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            value,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ],
      ),
    );
  }
}
