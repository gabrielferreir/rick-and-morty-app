import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:get_it/get_it.dart';
import 'package:rickandmorty/domain/entities/character.dart';
import 'package:rickandmorty/presenter/character/character_page.dart';
import 'package:shimmer/shimmer.dart';

class ItemGrid extends StatelessWidget {
  final Character character;

  ItemGrid({@required this.character});

  void _onTap(BuildContext context) => Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => CharacterPage(
                character: character,
              )));

  @override
  Widget build(BuildContext context) {
    return Material(
        child: InkWell(
            key: Key('item_grid_inkwell'),
            onTap: () => _onTap(context),
            child: Column(children: <Widget>[
              Expanded(
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(12.0),
                      child: CachedNetworkImage(
                          cacheManager: GetIt.instance.get<BaseCacheManager>(),
                          imageUrl: character.image,
                          placeholder: (context, url) => Shimmer.fromColors(
                              baseColor: Colors.grey[300],
                              highlightColor: Colors.grey[100],
                              child: Container(color: Colors.white)),
                          errorWidget: (context, url, error) {
                            print('errorWidget');
                            return Icon(
                              Icons.error,
                              key: Key('item_grid_image_error'),
                            );
                          }))),
              Container(
                  width: double.infinity,
                  child: Padding(
                      padding: const EdgeInsets.only(top: 8.0, left: 8.0),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(character.name,
                                style: TextStyle(
                                    fontSize: 16.0, color: Colors.black87)),
                            Text(character.species,
                                style: TextStyle(
                                    fontSize: 14.0, color: Colors.black54))
                          ])))
            ])));
  }
}
