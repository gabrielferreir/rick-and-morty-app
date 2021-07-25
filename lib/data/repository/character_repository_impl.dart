
import '../../domain/entities/character.dart';
import '../../domain/repository/character_repository.dart';
import '../datasource/character_datasource.dart';
import '../mapper/character_mapper.dart';

class CharacterRepositoryImpl implements CharacterRepository {
  final CharacterDatasource characterDatasource;
  final CharacterMapper characterMapper;

  CharacterRepositoryImpl({
    required this.characterDatasource,
    required this.characterMapper,
  });

  Future<List<Character>> get({int page = 1}) async {
    final characters = await characterDatasource.get(page: page);
    return characters.map(characterMapper.handle).toList();
  }
}
