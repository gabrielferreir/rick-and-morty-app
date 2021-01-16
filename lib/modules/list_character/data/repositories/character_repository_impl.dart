import 'dart:async';
import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:rickandmorty/modules/list_character/data/datasource/list_character_data_source.dart';
import 'package:rickandmorty/modules/list_character/domain/entities/character.dart';
import 'package:rickandmorty/modules/list_character/domain/mappers/character_mapper.dart';
import 'package:rickandmorty/modules/list_character/domain/repositories/character_repository.dart';

@LazySingleton(as: CharacterRepository)
class DisponibilidadeRepositoryImpl implements CharacterRepository {
  final ListCharacterDataSource listCharacterDataSource;
  final CharacterMapper characterMapper;

  const DisponibilidadeRepositoryImpl({
    this.listCharacterDataSource,
    this.characterMapper,
  })  : assert(listCharacterDataSource != null),
        assert(characterMapper != null);

  @override
  Future<List<Character>> search() async {
    try {
      final lastSearchModelList = await listCharacterDataSource.search();
      return characterMapper.fromModelList(lastSearchModelList);
    } catch (e) {
      rethrow;
    }
  }
}
