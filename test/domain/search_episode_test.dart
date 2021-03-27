import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:rickandmorty/domain/repository/episodes_repository.dart';
import 'package:rickandmorty/domain/usecase/search_episode.dart';

class EpisodesRepositoryMock extends Mock implements EpisodesRepository {}

void main() {
  final episodesRepositoryMock = EpisodesRepositoryMock();
  final searchEpisode =
      SearchEpisodeUseCaseImpl(episodesRepository: episodesRepositoryMock);

  group('SearchEpisodeUseCase', () {
    test('Should be return a episode', () async {
      await searchEpisode.call(id: 1);
      verify(episodesRepositoryMock.get(id: 1)).called(1);
    });
  });
}
