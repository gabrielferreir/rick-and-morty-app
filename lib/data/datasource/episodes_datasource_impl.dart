import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:rickandmorty/data/model/character_model.dart';
import 'package:rickandmorty/data/model/episodes_model.dart';

import 'episodes_datasource.dart';

class EpisodesDatasourceImpl implements EpisodesDatasource {
  final Dio dio;

  EpisodesDatasourceImpl({@required this.dio});

  Future<EpisodesModel> get({
    @required int id,
  }) async {
    final res = await dio.get('/episode/$id');
    Map result = res.data;
    final characters = (result['characters'] as List);
    final list = characters.map((item) async {
      final url = item.toString().split('/');
      final id = url[url.length - 1];
      final character = await dio.get('/character/$id');
      return CharacterModel.fromJSON(character.data);
    }).toList();
    final Future<List<CharacterModel>> listCharacterWait = Future.wait(list);
    final listCharacter = await listCharacterWait;
    final model = EpisodesModel.fromJSON(result);
    model.list = listCharacter;
    return model;
  }
}
