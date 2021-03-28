import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:rickandmorty/data/datasource/episodes_datasource_impl.dart';
import 'package:rickandmorty/data/model/episodes_model.dart';

class DioMock extends Mock implements Dio {}

void main() {
  final dioMock = DioMock();
  final episodesDatasource = EpisodesDatasourceImpl(dio: dioMock);
  group('EpisodesDatasource', () {
    test('Should be return a episode', () async {
      final fileEpisode = new File('test/data/mock/episodes.json');
      final jsonEpisode = jsonDecode(await fileEpisode.readAsString());

      final fileCharacter = new File('test/data/mock/character.json');
      final jsonCharacter = jsonDecode(await fileCharacter.readAsString());

      when(dioMock.get('/episode/1')).thenAnswer(
        (_) async => Response(data: jsonEpisode),
      );

      when(dioMock.get('/character/1')).thenAnswer(
        (_) async => Response(data: jsonCharacter),
      );
      final characters = await episodesDatasource.get(id: 1);
      expect(characters, isInstanceOf<EpisodesModel>());
    });
  });
}
