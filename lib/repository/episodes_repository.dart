import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:rickandmorty/model/character_model.dart';
import 'package:rickandmorty/model/episodes_model.dart';

class EpisodesRepository {
  final Dio dio;

  EpisodesRepository({@required this.dio});

  Future<EpisodesModel> get({int id}) async {
    final res = await dio.get('https://rickandmortyapi.com/api/episode/$id');

    Map result = res.data;

    final characters = (result['characters'] as List);
    final list = characters.map((item) async {
      final character = await dio.get(item);
      return Character.fromJSON(character.data);
    }).toList();

    final Future<List<Character>> listCharacterWait = Future.wait(list);

    final listCharacter = await listCharacterWait;

    final model = EpisodesModel.fromJSON(result);

    model.list = listCharacter;

    return model;
  }
}
