import '../models/character_model.dart';

abstract class ListCharacterDataSource {
  Future<List<CharacterModel>> search();
}
