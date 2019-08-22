import 'package:flutter/material.dart';
import 'package:rickandmorty/model/character_model.dart';

class CharacterPage extends StatelessWidget {
  final Character character;

  CharacterPage({@required this.character});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff4d4669),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          CircleAvatar(
                              radius: 32.0,
                              backgroundImage: NetworkImage(character.image)),
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(character.name,
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w600)),
                                Text(character.species,
                                    style: TextStyle(fontSize: 16.0))
                              ],
                            ),
                          )
                        ],
                      ),
                      // --------------------------------
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              ItemHeader(title: 'Status', subtitle: 'Alive'),
                              ItemHeader(title: 'Gender', subtitle: character.gender),
                              ItemHeader(title: 'Episodes', subtitle: character.episode.length.toString())
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ItemHeader extends StatelessWidget {
  final String title;
  final String subtitle;

  ItemHeader({@required this.title, @required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(title ?? '', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600, color: Colors.black87)),
        Text(subtitle ?? '', style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w400, color: Colors.black54)),
      ],
    );
  }
}
