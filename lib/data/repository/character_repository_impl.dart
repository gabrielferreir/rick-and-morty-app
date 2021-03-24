import 'package:meta/meta.dart';
import 'package:rickandmorty/data/datasource/character_datasource.dart';
import 'package:rickandmorty/data/mapper/character_mapper.dart';
import 'package:rickandmorty/domain/entities/character.dart';
import 'package:rickandmorty/domain/repository/character_repository.dart';

class CharacterRepositoryImpl implements CharacterRepository {
  final CharacterDatasource characterDatasource;
  final CharacterMapper characterMapper;

  CharacterRepositoryImpl({
    @required this.characterDatasource,
    @required this.characterMapper,
  });

  Future<List<Character>> get({int page = 1}) async {
    final characters = await characterDatasource.get(page: page);
    return characters.map((e) => characterMapper.handle(e)).toList();
  }
}
