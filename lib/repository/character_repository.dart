import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:rickandmorty/model/character_model.dart';

class CharacterRepository {
  final Dio dio;

  CharacterRepository({@required this.dio});

  Future<List<Character>> get() async {
    final res = await dio.get('https://rickandmortyapi.com/api/character/');

    List results = res.data['results'];

    return results.map((item) => Character.fromJSON(item)).toList();
  }
}
