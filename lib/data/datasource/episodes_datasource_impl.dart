import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:rickandmorty/data/model/character_model.dart';
import 'package:rickandmorty/data/model/episodes_model.dart';

import 'episodes_datasource.dart';

class EpisodesDatasourceImpl implements EpisodesDatasource {
  final Dio dio;

  EpisodesDatasourceImpl({@required this.dio});

  Future<EpisodesModel> get({int id}) async {
    final res = await dio.get('/episode/$id');
    Map result = res.data;
    final characters = (result['characters'] as List);
    final list = characters.map((item) async {
      final character = await dio.get(item);
      return CharacterModel.fromJSON(character.data);
    }).toList();
    final Future<List<CharacterModel>> listCharacterWait = Future.wait(list);
    final listCharacter = await listCharacterWait;
    final model = EpisodesModel.fromJSON(result);
    model.list = listCharacter;
    return model;
  }
}
