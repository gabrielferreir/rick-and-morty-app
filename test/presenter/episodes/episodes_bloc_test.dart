import 'package:bloc_test/bloc_test.dart';
import 'package:dio/dio.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rickandmorty/domain/entities/episodes.dart';
import 'package:rickandmorty/domain/usecase/search_episode.dart';
import 'package:rickandmorty/presenter/episodes/episodes_bloc.dart';
import 'package:rickandmorty/presenter/episodes/episodes_event.dart';
import 'package:rickandmorty/presenter/episodes/episodes_state.dart';
import 'package:test/test.dart';

import '../list_character/list_character_content_test.dart';

class SearchEpisodeUseCaseMock extends Mock implements SearchEpisodeUseCase {}

final episodeMock = Episodes(
    id: 1, episode: '1', name: 'Nome', list: rick20, airDate: '23/10/2018');

void main() {
  group('ListCharacterBloc', () {
    late EpisodesBloc episodesBloc;
    late SearchEpisodeUseCaseMock searchEpisodeUseCaseMock;

    setUp(() {
      searchEpisodeUseCaseMock = SearchEpisodeUseCaseMock();
      episodesBloc = EpisodesBloc(
        searchEpisodeUseCase: searchEpisodeUseCaseMock,
      );
    });

    test('Initial state is loading', () {
      expect(episodesBloc.state.toString(), Loading().toString());
    });

    blocTest(
      'Should search episode',
      build: () {
        when(() => searchEpisodeUseCaseMock.call(id: any(named: 'id')))
            .thenAnswer((_) async => episodeMock);
        return episodesBloc;
      },
      act: (bloc) async => (bloc as EpisodesBloc)..add(Started(id: 1)),
      expect: () => [Loaded(episodes: episodeMock)],
    );

    blocTest('Should return error when search episode',
        build: () {
          when(() => searchEpisodeUseCaseMock.call(id: any(named: 'id')))
              .thenThrow(DioError(
                  response: Response(
                      statusCode: 500,
                      requestOptions: RequestOptions(path: '')),
                  requestOptions: RequestOptions(path: '')));
          return episodesBloc;
        },
        act: (bloc) async => (bloc as EpisodesBloc)..add(Started(id: 1)),
        expect: () => [WithError(message: 'Internal server error')]);
  });
}
