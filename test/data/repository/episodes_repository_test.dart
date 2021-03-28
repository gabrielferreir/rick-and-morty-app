import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:rickandmorty/data/datasource/episodes_datasource.dart';
import 'package:rickandmorty/data/mapper/character_mapper.dart';
import 'package:rickandmorty/data/mapper/episodes_mapper.dart';
import 'package:rickandmorty/data/model/character_model.dart';
import 'package:rickandmorty/data/model/episodes_model.dart';
import 'package:rickandmorty/data/repository/episodes_repository_impl.dart';
import 'package:rickandmorty/domain/entities/episodes.dart';

class EpisodesDatasourceMock extends Mock implements EpisodesDatasource {}

void main() {
  final episodesDatasourceMock = EpisodesDatasourceMock();
  final episodesRepository = EpisodesRepositoryImpl(
      episodesDatasource: episodesDatasourceMock,
      episodesMapper: EpisodesMapper(characterMapper: CharacterMapper()));
  group('EpisodesRepository', () {
    test('Should be return a episode', () async {
      final fileEpisodes = new File('test/data/mock/episodes.json');
      final jsonEpisodes = jsonDecode(await fileEpisodes.readAsString());

      final fileCharacter = new File('test/data/mock/character.json');
      final jsonCharacter = jsonDecode(await fileCharacter.readAsString());

      when(episodesDatasourceMock.get(id: anyNamed('id'))).thenAnswer(
        (_) async {
          final model = EpisodesModel.fromJSON(jsonEpisodes);
          model.list = [CharacterModel.fromJSON(jsonCharacter)];
          return model;
        },
      );
      final episode = await episodesRepository.get(id: 1);
      expect(episode, isInstanceOf<Episodes>());
    });
  });
}
