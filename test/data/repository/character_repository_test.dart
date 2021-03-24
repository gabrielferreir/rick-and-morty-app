import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:rickandmorty/data/datasource/character_datasource.dart';
import 'package:rickandmorty/data/mapper/character_mapper.dart';
import 'package:rickandmorty/data/model/character_model.dart';
import 'package:rickandmorty/data/repository/character_repository_impl.dart';
import 'package:rickandmorty/domain/entities/character.dart';

class CharacterDatasourceMock extends Mock implements CharacterDatasource {}

void main() {
  final characterDatasourceMock = CharacterDatasourceMock();
  final characterRepository = CharacterRepositoryImpl(
    characterMapper: CharacterMapper(),
    characterDatasource: characterDatasourceMock,
  );
  group('CharacterRepository', () {
    test('Should be return a list of characters', () async {
      final file = new File('test/data/mock/character.json');
      final json = jsonDecode(await file.readAsString());

      when(characterDatasourceMock.get()).thenAnswer(
        (_) async {
          final List list = json['results'];
          return list.map((item) => CharacterModel.fromJSON(item)).toList();
        },
      );
      final characters = await characterRepository.get();
      expect(characters, isInstanceOf<List<Character>>());
      expect(characters.length, 20);
    });
  });
}
