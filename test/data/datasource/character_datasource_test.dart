import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:rickandmorty/data/datasource/character_datasource_impl.dart';
import 'package:rickandmorty/data/model/character_model.dart';

class DioMock extends Mock implements Dio {}

void main() {
  final dioMock = DioMock();
  final characterDatasource = CharacterDatasourceImpl(dio: dioMock);
  group('CharacterDatasource', () {
    test('Should be return a list of characters', () async {
      final file = new File('test/data/mock/characters.json');
      final json = jsonDecode(await file.readAsString());

      when(dioMock.get(any, queryParameters: anyNamed("queryParameters")))
          .thenAnswer(
        (_) async => Response(data: json),
      );
      final characters = await characterDatasource.get();
      expect(characters, isInstanceOf<List<CharacterModel>>());
      expect(characters.length, 20);
    });
  });
}
