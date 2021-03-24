import 'package:rickandmorty/domain/entities/character.dart';

abstract class CharacterRepository {
  Future<List<Character>> get({int page = 1});
}
