import 'package:flutter/material.dart';
import 'package:rickandmorty/domain/entities/character.dart';
import 'package:rickandmorty/presenter/character/character_page.dart';

class ItemGrid extends StatelessWidget {
  final Character character;

  ItemGrid({@required this.character});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CharacterPage(character: character)));
      },
      child: Column(children: <Widget>[
        Expanded(
            child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Container(
                    decoration: BoxDecoration(
                        color: Color(0xff4d4669),
                        image: DecorationImage(
                            image: NetworkImage(character.image),
                            fit: BoxFit.cover))))),
        Container(
            width: double.infinity,
            child: Padding(
                padding: const EdgeInsets.only(top: 8.0, left: 8.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        character.name,
                        style: TextStyle(fontSize: 16.0, color: Colors.black87),
                      ),
                      Text(character.species,
                          style:
                              TextStyle(fontSize: 14.0, color: Colors.black54))
                    ])))
      ]),
    );
  }
}
