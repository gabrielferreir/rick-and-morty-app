import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:get_it/get_it.dart';
import 'package:rickandmorty/domain/entities/character.dart';
import 'package:rickandmorty/presenter/shared/item_header.dart';
import 'package:rickandmorty/presenter/shared/line.dart';
import 'package:shimmer/shimmer.dart';

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
                              Container(
                                  height: 64,
                                  width: 64,
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(32.0),
                                      child: CachedNetworkImage(
                                          cacheManager: GetIt.instance
                                              .get<BaseCacheManager>(),
                                          imageUrl: character.image,
                                          placeholder: (context, url) =>
                                              Shimmer.fromColors(
                                                  baseColor: Colors.grey[300],
                                                  highlightColor:
                                                      Colors.grey[100],
                                                  child: Container(
                                                      color: Colors.white)),
                                          errorWidget: (context, url, error) =>
                                              Icon(Icons.error,
                                                  key: Key(
                                                      'character_page_image_error'))))),
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
                          child: Divider(),
                        ),
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
