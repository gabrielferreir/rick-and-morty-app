import 'package:flutter/material.dart';
import 'package:rickandmorty/domain/entities/character.dart';
import 'package:rickandmorty/presenter/shared/clip_image.dart';
import 'package:rickandmorty/presenter/shared/item_header.dart';
import 'package:rickandmorty/presenter/shared/line.dart';

import 'episode_card.dart';

class CharacterPage extends StatelessWidget {
  final Character character;

  CharacterPage({
    @required this.character,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff4d4669),
        body: SingleChildScrollView(
            child: Column(children: <Widget>[
          AppBar(elevation: 0.0, backgroundColor: Colors.transparent),
          Container(
              padding:
                  const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
              width: double.infinity,
              child: Card(
                  child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(children: <Widget>[
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              ClipImage(url: character.image),
                              Padding(
                                  padding: const EdgeInsets.only(left: 16.0),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(character.name,
                                            style: TextStyle(
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.w600)),
                                        Text(character.species,
                                            style: TextStyle(fontSize: 16.0))
                                      ]))
                            ]),
                        Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Divider()),
                        Container(
                            child: Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: <Widget>[
                                      ItemHeader(
                                          title: 'Status', subtitle: 'Alive'),
                                      ItemHeader(
                                          title: 'Gender',
                                          subtitle: character.gender),
                                      ItemHeader(
                                          title: 'Episodes',
                                          subtitle: character.episode.length
                                              .toString())
                                    ])))
                      ])))),
          Line(
              title: 'Location',
              subtitle: character.location,
              icon: Icons.location_on),
          Line(
              title: 'Origin',
              subtitle: character.origin,
              icon: Icons.location_city),
          EpisodesCard(episodes: character.episode)
        ])));
  }
}
