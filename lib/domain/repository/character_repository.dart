import '../entities/character.dart';

abstract class CharacterRepository {
  Future<List<Character>> get({int page = 1});
}
