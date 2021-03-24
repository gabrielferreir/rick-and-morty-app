import 'package:rickandmorty/data/model/character_model.dart';

abstract class CharacterDatasource {
  Future<List<CharacterModel>> get({int page = 1});
}
